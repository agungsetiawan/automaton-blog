class Article < ActiveRecord::Base

  belongs_to :category
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true 
  validates :category, presence: true 

end
