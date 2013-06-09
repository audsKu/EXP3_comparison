class Comparison < ActiveRecord::Base

  attr_accessible :original_id, :tester_response, :session_id
  belongs_to :session

  RESULTS_TO_INCLUDE = [:session_id, :original_id, :tester_response, :updated_at]

  @@comparison = Comparison.select(RESULTS_TO_INCLUDE)

  def self.to_csv
    CSV.generate do | csv |
      csv << RESULTS_TO_INCLUDE
      @@comparison.each do |record|
        csv << record.attributes.values
      end
    end
  end


end
