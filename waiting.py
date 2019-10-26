# create table train_status(train_id int, available_date varchar(20), booked_seats int,
# available_seats int, primary key(train_id,available_date),foreign key(train_id) references train(train_id)
# on update cascade on delete cascade);
import mysql.connector


def user_booking():

    email = input("Enter your email id:")
    source = input("Enter the source_id:")
    destination = input("Enter the destination_id:")
    train = input("Train_id")
    no_of_seats = int(input("Enter the required number of seats:"))
    try:
        mydb = mysql.connector.connect(
            host="localhost", database="Database", user="root", password="")
        mycursor = mydb.cursor(buffered=True)
        print('Database Connection Open')

        print("Station codes:")
        mycursor.execute("""select * from station""")
        row = mycursor.fetchone()
        while row is not None:
            print(row)
            row = mycursor.fetchone()
        print("Train codes:")

        mycursor.execute("""select train_id,train_name from train""")
        row = mycursor.fetchone()
        while row is not None:
            print(row)
            row = mycursor.fetchone()
        mycursor.execute("""SELECT available_seat FROM train_status where train_id=%s""",(train, ))
        #print("The number of parts: ", cur.rowcount)
        # print("hello")
        avail = mycursor.fetchone()
        # print("hii")

        # print(type(avail))
        if(avail[0] == 0):
            p = str(no_of_seats)
            mycursor.execute("""insert into waiting_list values(%s,%s,%s,%s, %s)""",
                        (email, source, destination, train, no_of_seats))
            print('you are added to the waiting list')
            print('The number of users already in waiting list are')

            mycursor.execute("""select * from waiting_list """)
            row = mycursor.fetchone()
            while row is not None:
                print(row)
                row = mycursor.fetchone()
        else:
            avail = avail[0] - no_of_seats
            if(avail[0] <= 0):
                print('Seats are not available')
            mycursor.execute("""SELECT booked_seats FROM train_status where train_id=%s""", (train))
            #print("The number of parts: ", cur.rowcount)
            booked = mycursor.fetchone()
            booked = booked[0] + no_of_seats
            p = str(no_of_seats)

            mycursor.execute("""insert into user_booking values(%s,%s,%s,%s, %s)""",
                        (email, source, destination, train, no_of_seats))

            mycursor.execute("""UPDATE train_status SET available_seat = %s, booked_seats = %s """, (str(
                avail), str(booked)))
            mydb.commit()

        #cur.execute("""insert into Media(ArticleID,MediaLink) values(%s,%s)""",(articleid,media_link))
        # cur.close()
        # conn.commit()
    except (Exception, mysql.connector.connect.DatabaseError) as error:
        print(error)

    return
