json.array!(@fate_cards) do |fate_card|
  json.extract! fate_card, :id
  json.url fate_card_url(fate_card, format: :json)
end
