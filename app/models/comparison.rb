class Comparison < ActiveRecord::Base

  attr_accessible :original_id, :tester_response
  belongs_to :session

  TOTAL_COMPARISON = 10

  SESSIONS = TOTAL_COMPARISON.times.collect do |original_comparison_id|
    { "original_id" => original_comparison_id }
  end.freeze

  def self.create_comparison_set
    self.create randomized_comparisons
  end

  private
    def self.randomized_comparisons
      @randomized_comparisons = self::SESSIONS
        .dup
        .shuffle
    end
end
