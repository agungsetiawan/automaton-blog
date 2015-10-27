class Category < ActiveRecord::Base

  has_many :articles

  validates :name, presence: true

  def to_param
  	"#{id}-#{slug}"
  end

end
