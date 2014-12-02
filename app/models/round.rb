class Round < ActiveRecord::Base
  has_many :guesses
  belongs_to :user
  belongs_to :deck

  def correctness
    all_guesses = Guess.where(round_id: self.id)
    correct_guesses = all_guesses.where(correct: 1)
    return (correct_guesses.length*100/all_guesses.length).to_s
  end

end
