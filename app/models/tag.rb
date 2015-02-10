# Your models should have validations

class Tag < ActiveRecord::Base
  belongs_to :post
end
