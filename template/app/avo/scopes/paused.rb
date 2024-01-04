class Avo::Scopes::Paused < Avo::Pro::Scopes::BaseScope
  self.name = "Paused"
  self.description = "Paused"
  self.scope = -> { query.all }
  self.visible = -> { true }
end
