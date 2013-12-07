require 'sequel'
#used to check my data base information if I have some errors can test to see if data behaves properly

DB = Sequel.sqlite('blog.db')
test =DB[:blogdata]
data = test.where[:id => 1] #data = test.first
#data = test.map([:title, :content, :date])
puts data.inspect
text = data[:title]
puts text   #tets to see what happens in some cases to figure out how sequel or sql behaves with ruby
puts data

tech = DB[:blogdata].filter(:id => '1').avg(:title)
puts tech

DB['SELECT * FROM blogdata ORDER BY date DESC LIMIT 3'].each do |row|
  p row
end

#DB['SELECT * from blogdata'].each do |row|
 # p row
#end

