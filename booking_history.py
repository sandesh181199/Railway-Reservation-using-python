import mysql.connector
import user_booking


def booking_history():
    email = input("Enter your email id:")
    password = input("Enter your password:")
    try:
        mydb = mysql.connector.connect( host="localhost", database="Database", user="root", password="")
        mycursor = mydb.cursor(buffered=True)
        print('Database Connection Open')

        print("Booking History:")
        mycursor.execute("""Select b.email_id,b.train_id,b.no_of_seats from user_booking b,user_details u where u.email_id = %s and u.password = %s and b.email_id = %s""", (email, password, email))
        row = mycursor.fetchone()
        while row is not None:
            print(row)
            row = mycursor.fetchone()

        mydb.commit()

    except (Exception, mysql.connector.connect.DatabaseError) as error:
        print(error)
    return
