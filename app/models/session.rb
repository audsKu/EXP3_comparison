class Session < ActiveRecord::Base
  attr_accessible :tester_id
  belongs_to :tester
  has_many :comparisons
end
