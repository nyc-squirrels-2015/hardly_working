# Your models should have validations

class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
end
