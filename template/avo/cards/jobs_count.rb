class Avo::Cards::JobsCount < Avo::Cards::MetricCard
  self.id = "jobs_count"
  self.label = "Jobs count"

  def query
    type = arguments.fetch :type

    query = SolidQueue::Job.all

    if type == :scheduled
      query = query.finished.invert_where
    end

    result query.length
  end
end
