class Session < ActiveRecord::Base
  attr_accessible :tester_id
  belongs_to :tester
  has_many :comparisons

  attr_accessible :tester_name

  TOTAL_COMPARISON = 90

  SESSIONS = 1.upto(TOTAL_COMPARISON).collect do | original_comparison_id |
    { "original_id" => original_comparison_id }
  end.freeze

  def create_comparison_set!
    Comparison.create randomized_comparisons(self)
  end

  private
    def randomized_comparisons(session)
      @randomized_comparisons = self.class::SESSIONS
      .dup
      .shuffle

      #append with an zero id for end of session
      @randomized_comparisons << { "original_id" => 0 }

      @randomized_comparisons.collect do |comparison|
        comparison.merge "session_id" => session.id
      end
    end

end
