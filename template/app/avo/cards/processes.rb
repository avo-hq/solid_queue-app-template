class Avo::Cards::Processes < Avo::Cards::PartialCard
  self.id = "processes"
  self.label = "Processes"
  self.partial = "avo/cards/processes"

  def processes
    SolidQueue::Process.all
  end
end

