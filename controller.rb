require 'sinatra'
require_relative './database.rb'

get '/' do
    redirect to '/student'
end

get '/student' do
    db = DBHandler.new
    @student = db.all
   erb :application do
      erb :index 
   end
end

get '/student/graduated' do
    db = DBHandler.new
    @graduated_students = db.graduated
   erb :application do
      erb :graduated
   end
end

get '/student/enrolled' do
    db = DBHandler.new
    @enrolled_students = db.enrolled
   erb :application do
      erb :enrolled
   end
end

get '/student/new' do
   erb :application do
       erb :new
   end
end

post '/student' do
   db = DBHandler.new
   db.create(params[:id], params[:firstName], params[:lastName], params[:major], params[:email], params[:studentStatus])
   redirect to '/student'
end

get '/student/:id' do
   id = params[:id]
   db = DBHandler.new
   @student = db.get(id)
   erb :application do
      erb :show 
   end
end

get '/student/:id/edit' do
    id = params[:id]
    db = DBHandler.new
    @student = db.get(id)
   erb :application do
      erb :edit 
   end
end

patch '/student/:id' do
  id = params[:id]
  db = DBHandler.new
  db.update(id, params[:firstName], params[:lastName], params[:major], params[:email], params[:studentStatus])
  redirect to '/student'
end

get '/student/:id/delete' do
   id = params[:id]
   db = DBHandler.new
   db.delete(id)
   redirect to '/student'
end

