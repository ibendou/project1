require 'sqlite3'

class DBHandler
    
   def initialize
      begin
        db = SQLite3::Database.open "student.db"
        dbstatement = "CREATE TABLE IF NOT EXISTS student(id TEXT PRIMARY KEY, firstName TEXT, lastName TEXT,
        major TEXT, email TEXT, studentStatus TEXT);"
        db.execute dbstatement
      rescue SQLite3::Exception => e
        puts "Exception Occured"
        puts e
      ensure
        db.close if db
      end
   end
    
    
   def all
      begin
        db = SQLite3::Database.open "student.db"
        dbstatement = "SELECT * FROM student;"
        db.execute dbstatement
      rescue SQLite3::Exception => e
        puts "Exception Occured"
        puts e
      ensure
        db.close if db
      end   
   end

   def create(id, firstName, lastName, major, email, studentStatus)
      begin
        db = SQLite3::Database.open "student.db"
        dbstatement = "INSERT INTO student(id, firstName, lastName, major, email, studentStatus) VALUES ('#{id}', '#{firstName}', '#{lastName}', '#{major}', '#{email}', '#{studentStatus}');"
        db.execute dbstatement
      rescue SQLite3::Exception => e
        puts "Exception Occured"
        puts e
      ensure
        db.close if db
      end
   end
   
   def get(id)
      begin
        db = SQLite3::Database.open "student.db"
        dbstatement = "SELECT * FROM student WHERE id='#{id}';"
        db.execute dbstatement
      rescue SQLite3::Exception => e
        puts "Exception Occured"
        puts e
      ensure
        db.close if db
      end       
   end
   
   def update(id, firstName, lastName, major, email, studentStatus)
      begin
        db = SQLite3::Database.open "student.db"
        dbstatement = "UPDATE student SET firstName='#{firstName}', lastName='#{lastName}', major='#{major}',
        email='#{email}', studentStatus='#{studentStatus}' WHERE id='#{id}';"
        db.execute dbstatement
      rescue SQLite3::Exception => e
        puts "Exception Occured"
        puts e
      ensure
        db.close if db
      end       
   end
   
   def delete(id)
      begin
        db = SQLite3::Database.open "student.db"
        dbstatement = "DELETE FROM student WHERE id='#{id}'"
        db.execute dbstatement
      rescue SQLite3::Exception => e
        puts "Exception Occured"
        puts e
      ensure
        db.close if db
      end       
   end
end