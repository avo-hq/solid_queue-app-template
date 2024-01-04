class Avo::Actions::Retry < Avo::BaseAction
  self.name = "Retry"

  def handle(query:, fields:, current_user:, resource:, **args)
    query.each do |record|
      record.retry
    end
  end
end
