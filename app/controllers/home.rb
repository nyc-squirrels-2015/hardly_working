get '/home' do
  @posts = Post.all
  erb :home
end
get '/page' do
  "yeya"
end

post '/page' do
  redirect '/page'
end
