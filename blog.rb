require 'sinatra'
require 'sequel'
require 'erb'

DB = Sequel.sqlite('blog.db')  #finds the data base "blog.db"
blogdata = DB[:blogdata]   #Takes DB and grabs the table blogdata as an object called blogdata

get '/' do
  @my_posts = blogdata.all.reverse
  erb :index
end

get '/firstpage.erb' do #the page that has form data to create a new blog. Needs renamed eventually but works atm.
  erb :firstpage
  
end

post '/firstpage.erb' do
  blogdata.insert(:title => "#{params[:title]}", 
                  :content => "#{params[:body]}", 
                  :date => Date.today)  
  redirect '/'
end
