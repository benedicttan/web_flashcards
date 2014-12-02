get "/newround" do

  this_user = User.where(email: session[:email]).first
  this_deck = Deck.find(params[:deck])

  Round.create(user: this_user, deck: this_deck)

  sampled_cards = this_deck.cards.shuffle.sample(10)

  sampled_cards.each do |card|
    Guess.create(card: card, round: Round.last, correct: nil)
  end

  @round = Round.last
  erb :newround

end

post "/check" do
  i = 0
  Round.last.guesses.each do |guess|
    if guess.card.title == params[:guess][i.to_s]
      # p "======>>>>>>>"
      guess.correct = 1
    else
      guess.correct = 0
    end
    guess.save
    i += 1
  end

  correct = Round.last.guesses.where(correct: 1).length
  wrong = Round.last.guesses.length - correct
  @message = "Result: " << correct.to_s << " correct (" << (correct*100/(correct+wrong)).to_s << "%)"
  erb :main
end