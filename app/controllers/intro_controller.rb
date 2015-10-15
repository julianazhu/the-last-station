class IntroController < ApplicationController
  def intro1
  end

  def intro2
    @character = Character.new
  end

  def intro3
  end

  def intro4
  end

  def validate_character
    @character = Character.new(character_params)
  end

  private
  def character_params
    params.require(:character).permit(:name, :gender, :avatar_image_path)
  end
end
