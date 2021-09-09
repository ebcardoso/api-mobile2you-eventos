class ParticipationsController < ApplicationController

  def create    
    @participation = Participation.new(user_id: current_user.id, event_id: params[:event_id])

    if @participation.save
      render json: {status: 201, subscribe: @participation}, status: :created
    else
      render json: {status: 500, errors: @participation.errors}, status: :unprocessable_entity
    end
  end
  
end