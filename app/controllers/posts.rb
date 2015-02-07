get '/posts/new' do
  erb :'posts/create_post'
end

post '/posts' do
  params[:new_post][:user_id] = current_user.id
  Post.create(params[:new_post])
  redirect "/user/#{current_user.id}"
end

get '/posts' do
  @posts = Post.all
  erb :'posts/all_posts', locals: {posts: Post.all}
end

get '/edit/:id' do |id|
  @post = Post.find(id)
  erb :edit
end

put '/posts/:id' do |id|
  post = Post.find(id)
  post.update_attributes(title: params[:title])
  redirect "/user/#{post.user_id}"
end

delete '/delete/:id' do |id|
  post = Post.find(id)
  post.delete
  redirect "/user/#{post.user_id}"
end
