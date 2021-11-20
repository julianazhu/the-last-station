# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Character, type: :model do
  describe '#name' do
    context 'on creation' do
      it 'validates character has a non-blank name' do
        character = Character.new
        character.name = ''
        expect(character.validate).to be_falsey
      end
    end
  end
end
