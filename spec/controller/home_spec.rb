require_relative '../spec_helper'

class HomeSpec
  describe 'home' do
    let (:user) { User.create(username: "Kenn", password_digest: "1234", super_user: false) }
    let (:post) { Post.create(photo_url: "http://i.imgur.com/K4SEoUI.jpg", title: "LOTR", user_id: 1) }
    let (:comment) { Comment.create(content: "This is a cool post", post_id: 1, user_id: 1) }

    before do
      user
      post
      comment
    end

    # pending 'should respond to /home' do
    #   get '/home'
    #   expect(last_response).to be_ok
    #   # expect(last_response).to include 'LOTR'
    # end

    # pending 'should respond to /page' do
    #   get '/page'
    #   expect(last_response).to be_ok
    #   expect(last_response.body).to include 'yeya'
    #   # This is going to need to be updated when/if we modify these routes
    # end

    # pending 'should respond to post /page' do
    #   post '/page'
    #   expect(last_response).to be_redirect
    #   follow_redirect!
    #   expect(last_response).to include 'yeya'
    # end
  end
end
