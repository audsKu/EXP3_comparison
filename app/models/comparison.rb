class Comparison < ActiveRecord::Base

  attr_reader :randomized_comparisons
  belongs_to :session

  TOTAL_COMPARISON = 10

  SESSIONS = TOTAL_COMPARISON.times.collect do |session_number|
    { "session" => session_number}
  end.freeze

  def self.randomized_comparisons
    @randomized_comparisons = self::SESSIONS
      .dup
      .shuffle
  end

end
