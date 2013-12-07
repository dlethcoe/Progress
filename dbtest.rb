require 'sequel'
#bunch of test code when I started with the databases trying to figure out how some of it worked. Just played with code here.
DB = Sequel.sqlite

DB.create_table :blogdata do
  primary_key :id
  String :title
  String :content
  String :date
end

blogdata = DB[:blogdata]

#filling in the table
blogdata.insert(:title => 'Rant', :content => 'Food', :date => '01/01/11')
blogdata.insert(:title => 'Rave', :content => 'Sex', :date => '01/02/11')
blogdata.insert(:title => 'Rand', :content => 'Money', :date => '01/03/11')
blogdata.insert(:title => 'Rant', :content => 'Food', :date => '01/04/11')

#blogdata.all
#blogdata.each{|row| p row} #full db returned with all entries
entry = blogdata.map([:content])
puts "content printed returned in an array #{entry}"  #map returns an array of entrys for the row in this case :content
puts entry  #array returned line by line
puts "Item count: #{blogdata.count}"

oldposts = blogdata.where(:id => 4)    #where used to pull a single record with :x column 
oldposts.each{|row| p row}             #result is an array of hashes  {thing: one, other: two}



last = blogdata.order(:date).last
last.each{|row| p row} #prints the array of hashes 
