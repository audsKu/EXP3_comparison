class Session < ActiveRecord::Base
  attr_accessible :tester_id
  belongs_to :tester
  has_many :comparisons

  attr_accessible :tester_name

  TOTAL_COMPARISON = 10

  SESSIONS = TOTAL_COMPARISON.times.collect do |original_comparison_id|
    { "original_id" => original_comparison_id }
  end.freeze

  def self.create_comparison_set
    Comparison.create randomized_comparisons
  end

  private
    def self.randomized_comparisons
      @randomized_comparisons = self::SESSIONS
      .dup
      .shuffle
    end

end
