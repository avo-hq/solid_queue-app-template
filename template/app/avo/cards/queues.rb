class Avo::Cards::Queues < Avo::Cards::PartialCard
  self.id = "queues"
  self.label = "Queues"
  self.partial = "avo/cards/queues"

  def queues
    SolidQueue::Queue.all
  end
end
