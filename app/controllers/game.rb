get '/' do

  redirect '/login'

end

get '/game/post/:id' do |id|

  @post = Post.find_by(id: id)
  @comments = @post.comments.all

  erb :'game/game'

end

post '/game/vote' do

  post = Post.find(params[:post_id])

  if params[:vote] == 'vote up'
    post.positive_score += 1
  else
    post.negative_score += 1
  end

  post.save
  redirect "game/post/#{Post.next_post_id(post.id)}"

end

post '/game/rotate' do

  current_post = Post.find(params[:post_id])
  redirect "/game/post/#{params[:direction] == 'back' ? Post.previous_post_id(current_post.id) : Post.next_post_id(current_post.id)}"

end

#############################################

get '/game/comment/:post_id' do
  @post = params[:post_id]
  erb :game_comment_form
end

post "/game/comments/:post_id" do
  Comment.create(content: params[:content], post_id: params[:post_id], user_id: current_user.id)
  redirect "/game/post/#{params[:post_id]}"
end

delete "/game/comment/:id" do |id|
  comment = Comment.find(id)
  x = comment.post_id
  comment.delete
  redirect "/game/post/#{x}"
end
