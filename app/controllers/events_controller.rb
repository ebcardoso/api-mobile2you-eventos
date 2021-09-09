class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy, :get_participants, :get_prizes]

  # ENDPOINTS
  # index   GET /events
  # show    GET /events/1
  # create  POST /events
  # update  PATCH/PUT /events/1
  # destroy DELETE /events/1

  def index
    @events = Event.all

    render json:{status: 200, events: @events}, status: :ok
  end

  def show
    render json: {status: 200, event: @event}, status: :ok
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      render json: {status: 201, event: @event}, status: :created, location: @event
    else
      render json: {status: 422, errors: @event.errors}, status: :unprocessable_entity
    end
  end

  def update
    if @event.update(event_params)
      render json: {status: 200, event: @event}, status: :ok
    else
      render json: {status: 422, errors: @event.errors}, status: :unprocessable_entity
    end
  end

  def destroy
    if @event.destroy
      render json: {status: 200, message: "Event Deleted!"}, status: :ok
    else
      render json: {status: 422, errors: @event.errors}, status: :unprocessable_entity
    end
  end

  def get_participants
    @users = User.joins(:participations).select('*').where('participations.event_id = ?', @event.id)

    render json: {status: 200, participants: @users}, status: :ok
  end

  def get_prizes
    @prizes = Participation.joins(:prize).select('*').where('participations.event_id = ?', @event.id)

    render json: {status: 200, participants: @prizes}, status: :ok
  end 

  private
    def set_event
      @event = Event.find_by(id: params[:id])
      if @event.nil?
        render json: {status: 404, message: "Event not found!"}, status: :not_found
      end
    end

    def event_params
      params.require(:event).permit(:name)
    end
end