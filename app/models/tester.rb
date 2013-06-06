class Tester < ActiveRecord::Base
  attr_accessible :name
  has_one :session
  has_many :comparisons, :through => :sessions
end