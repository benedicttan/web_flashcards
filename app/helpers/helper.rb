def decks
  Deck.all
end

def user
  User.where(email: session[:email]).first
end

def rounds
  Round.where(user_id: user.id)
end