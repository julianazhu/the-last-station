json.array!(@fate_cards) do |fate_card|
  json.extract! fate_card, :id, :character_id, :story_id, :deck_position
  json.url fate_card_url(fate_card, format: :json)
end
