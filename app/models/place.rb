class Place < ActiveRecord::Base
  belongs_to :comunes, :class_name => 'Comune', :foreign_key => :comune_id
  has_many :users, :class_name => 'User'
  has_many :users, :class_name => 'User'
  has_many :meetings, :class_name => 'Meeting'
  
  has_many :events, :through => :meetings, :class_name => 'Event'

end