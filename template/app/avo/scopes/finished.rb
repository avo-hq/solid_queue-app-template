class Avo::Scopes::Finished < Avo::Pro::Scopes::BaseScope
  self.name = "Finished"
  self.description = "Finished"
  self.scope = -> { query.finished }
  self.visible = -> { true }
end
