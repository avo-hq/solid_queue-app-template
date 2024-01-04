class Avo::Scopes::Scheduled < Avo::Pro::Scopes::BaseScope
  self.name = "Scheduled"
  self.description = "Scheduled"
  self.scope = -> { query.finished.invert_where }
  self.visible = -> { true }
end
