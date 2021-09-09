class PrizesController < ApplicationController
  before_action :set_prize, only: [:show, :update, :destroy]
  skip_before_action :authenticate_request

  # ENDPOINTS
  # GET /prizes/1
  # POST /prizes
  # DELETE /prizes/1
  
  def show
    render json: @prize
  end

  def create
    @user_id  = params[:user_id]
    @event_id = params[:event_id]
    @name     = params[:name]

    #Obtém o número de prêmios já distribuidos no evento
    @response = Participation.joins(:prize).select('count(*) as num_prizes').where('participations.event_id = ?', @event_id)
    
    if @response[0]["num_prizes"] > 3
      render json: {"error": 422, "messagem": "Número máximo de presentes já atingido!"}, status: :unprocessable_entity
    else
      @part = Participation.find_by(user_id: @user_id, event_id: @event_id)
      if @part.nil?
        render json: {status: 401, error: "Subscribe not found"}, status: :not_found
      elsif @part.prize.nil?
        if @part.create_prize!(name: @name)
          render json: {status: 201, prize: @part.prize}, status: :created
        else
          render json: {status: 500, error: "Internal Server Error"}, status: :unprocessable_entity
        end
      else 
        render json: {status: 422, error: "This user have alread got a prize!"}, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @prize.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prize
      @prize = Prize.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def prize_params
      params.require(:prize).permit(:name, :participation_id)
    end
end