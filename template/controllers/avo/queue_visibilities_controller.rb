class Avo::QueueVisibilitiesController < ApplicationController
  before_action :set_queue_by_name

  def update
    action = params[:queue_action]

    if action == "pause"
      @queue.pause
    elsif action == "resume"
      @queue.resume
    end

    redirect_to params[:frame_url]
  end

  private

  def set_queue_by_name
    @queue = SolidQueue::Queue.find_by_name params[:name]
  end
end
