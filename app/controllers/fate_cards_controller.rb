class FateCardsController < ApplicationController
  before_action :set_fate_card, only: [:show, :edit, :update, :destroy]

  def index
    @fate_cards = FateCard.all
  end

  def show
  end

  def new
    @fate_card = FateCard.new
  end

  def edit
  end

  def create
    @fate_card = FateCard.new(fate_card_params)

    respond_to do |format|
      if @fate_card.save
        redirect_to @fate_card, notice: 'Fate card was successfully created.'
      else
        render :new
      end
    end
  end

  def update
    respond_to do |format|
      if @fate_card.update(fate_card_params)
        redirect_to @fate_card, notice: 'Fate card was successfully updated.'
      else
        render :edit
      end
    end
  end

  def destroy
    @fate_card.destroy
    respond_to do |format|
      redirect_to fate_cards_url, notice: 'Fate card was successfully destroyed.'
    end
  end

  private
    def set_fate_card
      @fate_card = FateCard.find(params[:id])
    end

    def fate_card_params
      params.require(:fate_card).permit(:character_id, :story_id)
    end
end
