class Article < ActiveRecord::Base

  belongs_to :category
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true 
  validates :category, presence: true 

  def self.count_article(user=nil)
    return self.count if user.nil?

    self.where(user_id: user.id).count
  end

end
