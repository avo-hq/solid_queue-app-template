class Avo::Dashboards::SolidQueue < Avo::Dashboards::BaseDashboard
  self.id = "solid_queue"
  self.name = "Solid queue"

  def cards
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
    card Avo::Cards::FailedJobs

    divider label: "Queues information"

    card Avo::Cards::Queues, cols: 3

    divider label: "Processes information"

    card Avo::Cards::Processes, cols: 3
  end
end
