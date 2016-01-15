class FateCards
  attr_accessor :hand
  attr_accessor :deck
  @@max_deck_size = 6
  @@max_hand_size = 3
  @@new_deck_card_delay = 180 #seconds


  def initialize(character)
    @character = character
  end

  def get_eligible_fate_cards 
    Story.new.eligible_stories(@character, Story.where(:location => "Fate Card"))
  end





# gather cards of location == Fate Card
# create a deck size = 10, beginning at 6 and adding 1 every 3 minutes
# When 


end