require_relative '../spec_helper'

class AuthSpec
  describe 'auth' do
    let (:user) { User.create(username: "Kenn", password_digest: "1234", super_user: false) }
    # specify { session = { user_id: 1 } }

    before do
      user
    end

    it 'should respond to /' do #Remove pending once "game board" is completed
      get '/'
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_response.body).to include 'Signup Here:'
      # This needs to be updated once the main "game" page is completed
    end

    it 'should respond to /login' do
      get '/login'
      expect(last_response).to be_ok
      expect(last_response.body).to include 'Signup Here:'
      expect(last_response.body).to include 'Login'
      #This doesn't work because of bcrypt, not sure how to make it work
    end

    # it 'should respond to post route /login' do
    #   post '/login', params={ user: {username: "Kenn", password: "1234"} }
    #   expect(last_response).to be_redirect
    #   follow_redirect!
    #   expect(last_response.body).to include 'Kenn'
    #   #Bcrypt is giving me an error here, not sure what's going on
    # end

    it 'should respond to /logout' do
      get '/logout'
      expect(last_response.body).to include 'Really?'
    end

    it 'should respond to post route /logout' do
      post '/logout', nil, { user_id: user.id }
      expect(last_response).to be_redirect
      expect(session[:user_id]).to eq(nil)
    end

    it 'should respond to post route /signup' do
      post '/signup', params={ user: { username: "Bob", password: "1234", password_confirmation: "1234" } }
      expect(last_response).to be_redirect
      follow_redirect!
      follow_redirect!
      expect(last_response.body).to include 'Signup Here:'
      # This needs to be updated once the main "game" page is completed
    end

    it 'should respond to /user/:id' do
      get "/user/#{user.id}"
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_response.body).to include 'Signup Here:'
      #I have a feeling this might not work, double check the session id works appropriately with the let :user at the beginning of the class
    end

    # it 'should respond to /user/update/:id' do
    #   put "/user/update/#{user.id}", {username: "John"}, { user_id: user.id }
    #   expect(last_response).to be_redirect
    #   follow_redirect!
    #   expect(last_response.body).to include 'John'
    #   #Not sure if I used params correctly here to update the username
    # end

    it 'should respond to /delete/:user_id' do
      post "/delete/#{user.id}", nil, { user_id: user.id }
      delete "/delete/#{user.id}"
      expect(last_response).to be_redirect
      follow_redirect!
      expect(session[:user_id]).to eq(nil)
      expect(last_response.body).to include 'Signup Here:'
    end

  end
end
