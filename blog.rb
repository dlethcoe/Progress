require 'sinatra'
require 'sequel'
require 'erb'

DB = Sequel.sqlite('blog.db')  #finds the data base "blog.db"
blogdata = DB[:blogdata]   #Takes DB and grabs the table blogdata as an object called blogdata



class Blog  #vestigal class no longer serves any purpose I keep it in as sort of a reference
  def initialize(title, body)

    blogdata.insert(:title => "#{params[:title]}", :content => "#{params[:blog]}", :date => Date.today)
	
  end
end


get '/' do
  erb :index
  
end

get '/firstpage.erb' do #the page that has form data to create a new blog. Needs renamed eventually but works atm.
  erb :firstpage
  
end

get '/newpage.erb' do  #empty page with links to other pages just for testing to get mulitple pages going
  erb :newpage
  
end

get '/index.erb' do #main page directed to when first logging into the site.
 
 @row = DB['SELECT content FROM blogdata ORDER BY date DESC LIMIT 3']#.each do |row|   #trying to grab last three posts assign them as variables for passing
 my_posts = blogdata.select(:content)

 @post1, @post2, @post3 = my_posts
 puts my_posts
 #puts "hi"
 #puts @post1
 #puts @post2
 #puts @post3
 
  erb  :index
  
end

post '/firstpage.erb' do
 
 # blogdata.insert(:title => "#{params[:title]}", :content => "#{params[:body]}", :date => Date.today)  #commented out to test the passing of the variable with out cluttering database
  test = blogdata.where[:id => 1]
  @title =test[:title]   #sets variable title to pass test title to erb needs changed to the passed variable to make code work right
  @body =test[:content]  #sets variable for erb form to pass content
  
  erb :postdisplay, :locals => { :name => 'Steve' }  #steve is a test case to see if passing the variable tht way worked left it in
														#this method of locals not actually used but here for reminder purposes if i need it later 

end