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
    
        mydb = mysql.connector.connect( host="localhost", database="Database", user="root", password="")
        # mycursor = mydb.cursor(buffered=true)
        mycursor = mydb.cursor(buffered=True)
        print('Database Connection Open')

        mycursor.execute("""SELECT available_seat FROM train_status  where train_id=%s""",(train, ))
        avail = mycursor.fetchone()
        avail = avail[0] - no_of_seats

        sql="SELECT booked_seats FROM train_status where train_id=%s"
        values=(train, )
        mycursor.execute(sql, values)
        booked = mycursor.fetchone()
        booked = booked[0] + no_of_seats
        p = str(no_of_seats)
        mycursor.execute("""insert into user_booking values(%s,%s,%s,%s, %s)""",
                    (email, source, destination, train, no_of_seats))

        mycursor.execute("""UPDATE train_status SET available_seat = %s, booked_seats = %s where train_id = %s """, (str(
            avail), str(booked), train))
        mydb.commit()
        #cur.execute("""insert into Media(ArticleID,MediaLink) values(%s,%s)""",(articleid,media_link))
        # cur.close()
        # conn.commit()
    except (Exception, mysql.connector.DatabaseError) as error:
        print(error)
        return
        