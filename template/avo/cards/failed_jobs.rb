class Avo::Cards::FailedJobs < Avo::Cards::MetricCard
  self.id = "failed_count"
  self.label = "Failed count"

  def query
    result SolidQueue::FailedExecution.count
  end
end
