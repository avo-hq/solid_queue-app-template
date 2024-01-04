class Avo::Resources::SolidQueueProcess < Avo::BaseResource
  self.includes = []
  self.model_class = "SolidQueue::Process"

  def fields
    field :id, as: :id
    field :kind, as: :text
    field :last_heartbeat_at, as: :date_time
    field :supervisor_id, as: :number
    field :pid, as: :number
    field :hostname, as: :number
    field :metadata, as: :code
  end
end
