class Comparison < ActiveRecord::Base

  attr_accessible :original_id, :tester_response
  belongs_to :session

end
