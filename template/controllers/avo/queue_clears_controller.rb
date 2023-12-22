class Avo::QueueClearsController < ApplicationController
  before_action :set_queue_by_name

  def update
    @queue.clear

    redirect_to params[:frame_url]
  end

  private

  def set_queue_by_name
    @queue = SolidQueue::Queue.find_by_name params[:name]
  end
end
