class Article < ActiveRecord::Base

  before_create :create_slug

  belongs_to :category
  belongs_to :user
  has_many :comments

  validates :title, presence: true
  validates :body, presence: true 
  validates :category, presence: true 

  def to_param
  	"#{id}-#{slug}"
  end

  def create_slug
  	self.slug=self.title.downcase.gsub(/[^0-9a-z]/i,"-")
  end

  def self.count_article(user=nil)
    return self.count if user.nil?

    self.where(user_id: user.id).count
  end

end
