get '/posts/new' do
  erb :'posts/create_post'
end

post '/posts' do
  # session[:user_id] = 1
  params[:new_post][:user_id] = current_user.id
  Post.create(params[:new_post])
  redirect '/'
end

get '/posts' do
  @posts = Post.all
  erb :'posts/all_posts', locals: {posts: Post.all}
end
