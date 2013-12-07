require_relative "views/posts/save_data"
require 'json'
#worthless test file not using it for anything just when i was figuring out code at one point.

posts = [] #creates global post array variable
posts << { :title => "t2", :blog => "more things", :date => "1/1/21" } # add a post hash to the array
posts <<  { :fart => "THHH", :theme => "more", :date => "10/2/21"}
output = JSON.generate(posts)



#File.open("views/posts/save_data", 'a+') {|f| f.write(output)}


#puts "The saved data is: \n"

#puts File.read("views/posts/save_data")

#saved = File.read("views/posts/save_data")
#puts saved
file = open("views/posts/save_data")
json = file.read

parsed = JSON.parse ([json].to_json)
if parsed.kind_of? (Array)
 p "true"
else
  puts "false"
end
p parsed[0]
#puts "it should have shown."

#data = JSON.parse(saved)
#post = data[0]['date']
#past = data[0]
#pest = data[2]


#puts "#{data}"


#puts "maybe failed?"



#puts "array"
#puts post
#puts "1"
#puts past
#puts "0"
#puts pest
#puts "2"
