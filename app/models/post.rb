# Your models should have validations

class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :tags

  def self.next_post_id(current_id)
    find_by(id: current_id + 1) ? current_id + 1 : 1
  end

  def self.previous_post_id(current_id)
    find_by(id: current_id - 1) ? current_id - 1 : all.last.id
  end

end
