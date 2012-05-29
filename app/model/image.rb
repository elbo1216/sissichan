class Image < ActiveRecord::Base
  belongs_to :thumbnail
  has_many :gallery

end
