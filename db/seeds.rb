def seedRuby
  Deck.create(title: "Ruby Terms")

  @file = File.open("db/ruby-terms.txt")
  i = 0
  description = ""
  @file.each { |x|
    i += 1
    case i%3
    when 1 # description
      description = x.chomp
    when 2 # title
      Card.create(title: x.chomp, description: description, deck_id: Deck.last.id)
    end
  }
end

def seedDictionary
  Deck.create(title: "English-Malay Dictionary")

  @file = File.open("db/english-malay.txt")
  @file.each do |x|
    words = x.split(" ")
    Card.create(title: words.first, description: words.last, deck_id: Deck.last.id)
  end
end

seedDictionary
seedRuby