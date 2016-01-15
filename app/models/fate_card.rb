class FateCard < ActiveRecord::Base
  belongs_to :character
  belongs_to :story
  validates_presence_of :character_id
  validates_presence_of :story_id

  @@max_deck_size = 6
  @@max_hand_size = 3
  @@new_deck_card_delay = 180 #seconds

  def get_hand(character)
    @character = character
    if @character.fate_cards.exists?
      fate_cards = @character.fate_cards
    else
      fate_cards = build_hand(@character)
    end
    @hand = get_cards_as_stories_array(fate_cards)
  end

  def get_cards_as_stories_array(fate_cards)
    @hand = []
    fate_cards.each do |card|
      @hand.push(card.story)
    end
    @hand
  end

  def build_hand(character)
    @character = character
    cards_in_hand = @character.fate_cards.size
    while cards_in_hand < @@max_hand_size do
      add_card_to_hand
      cards_in_hand +=1
    end
    @character.fate_cards
  end

  def add_card_to_hand
    random_card = all_eligible_fate_cards.sample
    if @character.fate_cards.where(:story_id => random_card.id).exists?
      random_card = all_eligible_fate_cards.sample
    else
      return FateCard.create(:character_id => @character.id, :story_id => random_card.id)
    end
  end

  def all_eligible_fate_cards
    all_eligible_fate_cards = Story.new.eligible_stories(@character, Story.where(:location => "Fate Card"))
  end
end
