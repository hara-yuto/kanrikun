class EventsController < ApplicationController
  def index
    @events = Event.all
    @event = Event.new
    
  end
  def new
    @event = Event.new
  end

  def create
    event=Event.create(event_parameter)
    if  event.save
        flash[:notice] = "入力が完了いたしました！"
        redirect_to root_path
    else
      render :index
    end

  end

  def show
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path, notice:"削除しました"
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_parameter)
      redirect_to root_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def event_parameter
    params.require(:event).permit(:title, :content,:worktime, :start_time).merge(user_id: current_user.id)
  end
end


