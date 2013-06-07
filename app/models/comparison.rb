class Comparison < ActiveRecord::Base

  attr_accessible :original_id, :tester_response, :session_id
  belongs_to :session

end
