class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    authorize Event
    @events = Event.all
  end

  def show
    authorize Event
    @event = Event.find(params[:id])
    @type_events = Event.type_events.keys
  end

  def new
    authorize Event
    @event = Event.new
    @users = User.without_role(:admin)
    @type_events = Event.type_events.keys
  end

  def edit
    authorize Event
    @event = Event.find(params[:id])
    @users = User.all
    @type_events = Event.type_events.keys
  end

  def create
    authorize Event
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.js
      end
    end
  end

  def update
    authorize Event
    @event.update(event_params)
  end

  def destroy
    authorize Event
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
    end
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:description, :star_time, :end_time, :type_event, {:user_ids =>[]})
    end
end
