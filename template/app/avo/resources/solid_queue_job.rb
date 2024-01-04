class Avo::Resources::SolidQueueJob < Avo::BaseResource
  self.includes = []
  self.title = :class_name
  self.model_class = "SolidQueue::Job"
  self.authorization_policy = SolidQueue::JobPolicy

  def fields
    main_panel do
      field :id, as: :id
      field :queue_name, as: :text
      field :class_name, as: :text
      field :arguments_name, as: :code
      field :priority, as: :number
      field :scheduled_at, as: :date_time
      field :finished_at, as: :date_time
      field :queue_status, as: :badge, options: {success: :running, warning: :paused} do
        job_queue = SolidQueue::Queue.all.find do |queue|
          record.queue_name == queue.name
        end

        job_queue.paused? ? :paused : :running
      end
      sidebar do
        field :active_job_id, as: :text
        field :concurrency_key, as: :date_time
      end
    end

    # field :claimed_execution, as: :has_one
    # field :ready_execution, as: :has_one
    field :failed_execution, as: :has_one
    # has_one :ready_execution, dependent: :destroy
    # has_one :claimed_execution, dependent: :destroy
    # has_one :failed_execution, dependent: :destroy

    # has_one :scheduled_execution, dependent: :destroy
  end

  def scopes
    scope Avo::Scopes::Finished
    scope Avo::Scopes::Scheduled
    scope Avo::Scopes::Failed
  end

  def cards
    if view.index?
      card Avo::Cards::JobsCount,
        label: "Scheduled jobs",
        arguments: {
          type: :scheduled
        }
      card Avo::Cards::JobsCount,
        label: "Total jobs",
        arguments: {
          type: :total_jobs
        }
    end
  end
end
