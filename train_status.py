import mysql.connector


def train_stat():
    trainID = input("Enter train_id")
    # trainID=19020
    try:
        mydb = mysql.connector.connect( host="localhost", database="Database", user="root", password="")
        mycursor = mydb.cursor(buffered=True)
        print('Database Connection Open')

        mycursor.execute("""SELECT s.train_id , s.available_date, s.available_seat from train_status s where train_id= %s""",(trainID, ))
        #row = cur.fetchone()
        row = mycursor.fetchone()
        while row is not None:
            print(row)
            row = mycursor.fetchone()

        mydb.commit()

    except (Exception, mysql.connector.connect.DatabaseError) as error:
        print(error)

    return
