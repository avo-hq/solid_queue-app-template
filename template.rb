# Insert templates here

# === Add routes ===
route_contents = <<-ROUTES
  # Avo admin panel
  if defined? ::Avo
    Avo::Engine.routes.draw do
      resource :queue_visibility, only: :update
      resource :queue_clear, only: :update
    end
  end
ROUTES
route route_contents

# === Copy template files ===
files.each do |path, contents|
  file path, contents
end
