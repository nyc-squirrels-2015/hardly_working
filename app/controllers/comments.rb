get '/comment/:post_id' do
  @post = params[:post_id]
  erb :comment_form
end

post "/comments/:post_id" do
  Comment.create(content: params[:content], post_id: params[:post_id], user_id: current_user.id)
  redirect '/posts'
end

delete "/comment/:id" do |id|
  comment = Comment.find(id)
  comment.delete
  redirect '/posts'
end

