get '/login' do
  erb :login
end

post '/login' do
  if @user = User.find_by(username: params[:user][:username]).try(:authenticate, params[:user][:password])
    session[:user_id] = @user.id
    redirect "/user/#{@user.id}"
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
  @user = User.find(id)
  if session[:user_id] == @user.id
    erb :show
  else
    redirect '/login'
  end
end

delete "/delete/:user_id" do |user_id|
  user = User.find(user_id)
  # user.posts.each do |post|
  #   post.each do |comment| do
  #     comment.delete
  #   end
  # end
  # user.posts.each do |post|
  #   post.delete
  # end
  user.delete
  session.clear
  redirect '/login'
end

put "/user/update/:id" do |id|
  user = User.find(id)
  user.update_attributes(username: params[:username])
  redirect "/user/#{user.id}"
end

