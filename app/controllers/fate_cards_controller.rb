class FateCardsController < ApplicationController
  before_action :set_fate_card, only: [:show, :edit, :update, :destroy]

  # GET /fate_cards
  # GET /fate_cards.json
  def index
    @fate_cards = FateCard.all
  end

  # GET /fate_cards/1
  # GET /fate_cards/1.json
  def show
  end

  # GET /fate_cards/new
  def new
    @fate_card = FateCard.new
  end

  # GET /fate_cards/1/edit
  def edit
  end

  # POST /fate_cards
  # POST /fate_cards.json
  def create
    @fate_card = FateCard.new(fate_card_params)

    respond_to do |format|
      if @fate_card.save
        format.html { redirect_to @fate_card, notice: 'Fate card was successfully created.' }
        format.json { render :show, status: :created, location: @fate_card }
      else
        format.html { render :new }
        format.json { render json: @fate_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fate_cards/1
  # PATCH/PUT /fate_cards/1.json
  def update
    respond_to do |format|
      if @fate_card.update(fate_card_params)
        format.html { redirect_to @fate_card, notice: 'Fate card was successfully updated.' }
        format.json { render :show, status: :ok, location: @fate_card }
      else
        format.html { render :edit }
        format.json { render json: @fate_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fate_cards/1
  # DELETE /fate_cards/1.json
  def destroy
    @fate_card.destroy
    respond_to do |format|
      format.html { redirect_to fate_cards_url, notice: 'Fate card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fate_card
      @fate_card = FateCard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fate_card_params
      params[:fate_card]
    end
end
