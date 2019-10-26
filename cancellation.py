# create table train_status(train_id int, available_date varchar(20), booked_seats int,
# available_seats int, primary key(train_id,available_date),foreign key(train_id) references train(train_id)
# on update cascade on delete cascade);

import mysql.connector

def cancel():

    email = input("Enter your email id:")
    password = input("Enter your password:")
    #source = raw_input("Enter the source_id:")
    #destination = raw_input("Enter the destination_id:")
    #train = raw_input("Train_id")
    #no_of_seats = int(raw_input("Enter the required number of seats:"))
    try:
        mydb = mysql.connector.connect( host="localhost", database="Database", user="root", password="")
        # mycursor = mydb.cursor(buffered=true)
        mycursor = mydb.cursor(buffered=True)
        mycursor1 = mydb.cursor(buffered=True)
        print('Database Connection Open')

        mycursor.execute("""SELECT b.email_id,train_id,no_of_seats from user_booking b,user_details u where u.email_id = %s and u.password = %s and b.email_id = %s""", (email, password, email))
        seats = int(input("Enter the number of seats you want to delete"))

        mycursor.execute("""SELECT train_id from user_booking b,user_details u where u.email_id = %s and u.password = %s and b.email_id = %s""", (email, password, email))
        train_id = mycursor.fetchone()
        print(train_id)
        train_id = train_id[0]
        print(train_id)
        # print(type(train_id))

        mycursor1.execute("""SELECT available_seat FROM train_status where train_id = %s""", (train_id,))
        avail = mycursor1.fetchall()
        avail = avail[0]
        avail = avail[0]
        # print(type(avail))
        avail = avail + seats

        mycursor.execute("""SELECT booked_seats FROM train_status where train_id = %s""", (train_id,))
        booked = mycursor.fetchone()
        booked=booked[0]
        booked = booked - seats
        
        mycursor.execute("""UPDATE train_status SET available_seat = %s, booked_seats = %s where train_id like %s""", (str(
            avail), str(booked), (train_id))	)
        
        mycursor.execute("""SELECT no_of_seats from user_booking b,user_details u where u.email_id = %s and u.password = %s and b.email_id = %s""", (email, password, email))
        booked_seats = mycursor.fetchone()
        print(booked_seats[0])
        booked_seats= booked_seats[0]
        seat = booked_seats - seats
        print('hello')
        if(seat == 0):
            mycursor.execute(
                """DELETE * from user_booking b,user_details u where u.email_id = %s and u.password = %s and b.email_id = %s""", (email, password, email))
        else:
            seat = str(seat)
        mycursor.execute(""" update user_booking set no_of_seats = %s where email_id = %s""", (seat,email))
        mydb.commit()

    except (Exception, mysql.connector.DatabaseError) as error:
        print(error)
    return
