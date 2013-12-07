require 'sequel'
#script used for creation of test data sets or just database creation.


DB = Sequel.sqlite('blog.db') #creates the data base named blog.db and saves it in root folder
DB.create_table :blogdata do   #declares database table and keys
  primary_key :id
  String :title
  String :content
  String :date
end

blogdata = DB[:blogdata] #sets it to an object called blogdata for the table :blogdata

#filling in the table with data for test purposes
blogdata.insert(:title => 'First', :content => 'Food', :date => '01/01/11')
blogdata.insert(:title => 'Second', :content => 'Sex', :date => '01/02/11')
blogdata.insert(:title => 'Third', :content => 'Money', :date => '01/03/11')
blogdata.insert(:title => 'Fourth', :content => 'Work', :date => '01/04/11')


