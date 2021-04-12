class EventsController < ApplicationController
  before_action :authenticate_user!,only:[:show,:edit]
  before_action :rooting,only: [:show,:edit]
  def index
    @events = Event.all
    @event = Event.new
  end

  def create
    event = Event.new(event_parameter)

    if event.save
      flash[:notice] = '保存が完了いたしました！'
      redirect_to root_path
    else
      flash[:notice] = '保存できません！'
      redirect_to root_path
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path, notice: '削除しました！'
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_parameter)
      redirect_to event_path, notice: '編集しました！'
    else
      flash[:notice] = '編集できません！'
      redirect_to edit_event_path(@event)
    end
  end

  private

  def event_parameter
    params.require(:event).permit(:title, :content, :worktime, :start_time).merge(user_id: current_user.id)
  end

 def rooting
  @event = Event.find(params[:id])
  unless @event.user.id == current_user.id
    redirect_to root_path
  end
 end

end
