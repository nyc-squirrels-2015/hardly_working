get '/' do

  redirect '/game/post/1'
  
end

get '/game/post/:id' do |id|

  erb :'game/game', locals: { post: Post.find_by(id: id) }

end

post '/game/vote' do

  post = Post.find(params[:post_id])
  
  if params[:vote] == 'vote up'
    post.positive_score += 1
  else post.negative_score += 1
  end

  post.save
  redirect "game/post/#{Post.next_post_id(post.id)}"

end

post '/game/rotate' do
  
  current_post = Post.find(params[:post_id])
  redirect "/game/post/#{params[:direction] == 'back' ? Post.previous_post_id(current_post.id) : Post.next_post_id(current_post.id)}"
  
end