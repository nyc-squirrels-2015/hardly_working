require_relative '../spec_helper'

class PostSpec
  describe 'post' do
    let (:user) { User.create(username: "Kenn", password_digest: "1234", super_user: false) }
    let (:post) { Post.create(photo_url: "http://i.imgur.com/K4SEoUI.jpg", title: "LOTR", user_id: 1) }

    before do
      user
      post
    end

    it 'should respond to /post/new' do
      get '/posts/new'
      expect(last_response).to be_ok
      expect(last_response.body).to include 'Create New Post'
    end

    # it 'should respond to /posts' do
    #   post '/posts', params={ new_post: {title: "Dog", photo_url: "http://i.imgur.com/n30Ftza.jpg"} }
    #   expect(last_response).to be_redirect
    #   follow_redirect!
    #   expect(last_response.body).to include 'Dog'
    # end

    it 'should respond to /edit/:id' do
      get "/edit/#{post.id}"
      expect(last_response).to be_ok
      expect(last_response.body).to include 'Edit Title'
    end

    # it 'should respond to /posts/:id' do
    #   put "/post/#{post.id}", params={ title: "Young Frodo" }
    #   expect(last_response).to be_redirect
    #   follow_redirect!
    #   expect(last_response.body).to incldue 'Young Frodo'
    # end

    # it 'should respond to /delete/post/:id' do
    #   delete '/delete/post/#{post.id}'
    #   expect(last_response).to be_redirect
    #   follow_redirect!
    #   expect(last_response.body).not_to include "LOTR"
    # end
  end
end
