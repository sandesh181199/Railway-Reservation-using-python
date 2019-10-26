# create table user_details(email_id varchar(30) primary key, password varchar(15) not null, name varchar(30)
# not null, gender char(1) not null, age int not null, mobile varchar(14) not null, city varchar(20) not null,
# state varchar(25) not null,CHECK(gender='M' or gender='F'));
import mysql.connector
#import user_booking


def user_details():
    email = input("Enter your email id:")
    password = input("Enter your password:")
    name = input("Enter your name:")
    gender = input("Enter your gender(M/F):")
    #age = input("Enter your age:")
    mobile = input("Enter your mobile no. :")
    city = input("Enter your city:")
    state = input("Enter your state:")
    try:
        mydb = mysql.connector.connect(
            host="localhost", database="Database", user="root", password="")
        mycursor = mydb.cursor(buffered=True)
        print('Database Connection Open')

        mycursor.execute("""insert into user_details values(%s,%s,%s,%s,%s,%s,%s)""",
                    (email, password, name, gender, mobile, city, state))
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
        mydb.commit()

        #mycursor.execute("""insert into Media(ArticleID,MediaLink) values(%s,%s)""",(articleid,media_link))
        # mycursor.close()
        # conn.commit()
    except (Exception, mysql.connector.connect.DatabaseError) as error:
        print(error)

    # user_booking.user_booking()
    return
