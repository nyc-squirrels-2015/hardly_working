# enable :sessions

get '/' do
  "howdy"
end

get '/login' do
  erb :login
end

post '/login' do
  p "ayo #{session}"
  if user = User.find_by(username: params[:user][:username]).try(:authenticate, params[:user][:password])
    session[:user_id] = user.id
    p "inside #{session}"
    redirect "/user/#{user.id}"
  else
    redirect '/login'
  end
end

get '/logout' do
  erb :logout
end

post '/logout' do
  session.clear
  redirect '/login'
end


post '/signup' do
  User.create(params[:user])
  redirect '/'
end

get '/user/:id' do |id|
  # sessions issue
  @user = User.find(id)
  erb :show
end


