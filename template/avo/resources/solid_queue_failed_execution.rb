class Avo::Resources::SolidQueueFailedExecution < Avo::BaseResource
  self.includes = []
  self.model_class = "SolidQueue::FailedExecution"
  self.authorization_policy = SolidQueue::FailedExecutionPolicy
  TITLE_BLOCK = -> { "#{record.job.class_name} - #{record&.error.fetch("exception_class")} \"#{record&.error.fetch("message")}\"" }
  self.title = TITLE_BLOCK

  self.row_controls = -> {
    action Avo::Actions::Retry
  }

  def fields
    field :id, as: :id
    field :title, as: :text, &TITLE_BLOCK
    field :error, as: :code, language: "javascript" do
      if record.error.present?
        JSON.pretty_generate(record.error.as_json)
      end
    end
    field :job, as: :belongs_to
  end

  def actions
    action Avo::Actions::Retry
  end
end
