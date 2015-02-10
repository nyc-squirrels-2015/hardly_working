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
  redirect '/login'
end

# This looks like something that belongs in a different controller
get '/user/:id' do |id|
  @user = User.find(id)
  if session[:user_id] == @user.id
    erb :show
  else
    redirect '/login'
  end
end

delete "/delete/:user_id" do |user_id|
  # if you want to destroy all the posts created by a user,
  # use the dependant: :destroy in your User model.
  # Also, move this route to the User controller
  user = User.find(user_id)
  x = Post.where(user_id: user.id)
  x.each{|pl| pl.comments{|a| a.destroy}}
  x.each{|one| one.destroy}
  user.comments.each{|single| single.destroy}
  user.delete
  session.clear
  redirect '/login'
end

put "/user/update/:id" do |id|
  user = User.find(id)
  user.update_attributes(username: params[:username])
  redirect "/user/#{user.id}"
end

