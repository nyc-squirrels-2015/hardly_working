require_relative '../spec_helper'

class CommentSpec
  describe 'comments' do
    let (:user) { User.create(username: "Kenn", password_digest: "1234", super_user: false) }
    let (:post) { Post.create(photo_url: "http://i.imgur.com/K4SEoUI.jpg", title: "LOTR", user_id: 1) }
    let (:comment) { Comment.create(content: "This is a cool post", post_id: 1, user_id: 1) }

    before do
      user
      post
      comment
    end

    it 'should respond to /comment/:post_id' do
      get "/comment/#{user.id}"
      expect(last_response).to be_ok
      expect(last_response.body).to include 'What Do You Have To Say:'
    end

    # it 'should respond to /comments/:post_id' do
    #   post "/comments/#{post.id}", { content: "Hahaha", post_id: post.id }, { user_id: user.id }
    #   expect(last_response).to be_redirect
    #   follow_redirect!
    #   expect(last_response.body).to include "Hahaha"
    # end

    it 'should respond to /comment/:id' do
      delete "/comment/#{comment.id}"
      expect(last_response).to be_redirect
      expect(last_response.body).not_to include "This is a cool post"
    end
  end
end
