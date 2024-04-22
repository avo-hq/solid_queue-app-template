class Avo::Scopes::Finished < Avo::Advanced::Scopes::BaseScope
  self.name = "Finished"
  self.description = "Finished"
  self.scope = -> { query.finished }
  self.visible = -> { true }
end
