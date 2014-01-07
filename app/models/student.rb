class Student < ActiveRecord::Base
  validates :last_name, presence: false
end