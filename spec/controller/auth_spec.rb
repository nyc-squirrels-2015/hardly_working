require_relative '../spec_helper'

class AuthSpec
  describe 'auth' do
    let (:user) { User.create(username: "Kenn", password_digest: "1234", super_user: false)}

    before do
      user
    end

    it 'should respond to /' do
      get '/'
      expect(last_response).to be_ok
      expect(last_response.body).to include 'howdy'
    end
  end
end
