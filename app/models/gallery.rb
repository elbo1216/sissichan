class Gallery < ActiveRecord::Base
  belongs_to :image, :class_name => 'PhotoImage'
end
