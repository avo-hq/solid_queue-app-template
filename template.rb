# Insert templates here

if ARGV.include? "--community-edition"
  edition = "community"
elsif ARGV.include? "--pro-edition"
  edition = "pro"
elsif ARGV.include? "--advanced-edition"
  edition = "advanced"
end

unless edition
  # === Fetch the Avo edition ===
  question = <<~QUESTION
    What version of Avo would you like to install?
    1. Avo Community (default)
    2. Avo Pro
    3. Avo Advanced
  QUESTION

  answer = ask(question, default: "1", limited_to: ["1", "2", "3"])

  edition = case answer
  when "1"
    "community"
  when "2"
    "pro"
  when "3"
    "advanced"
  end
end

# === Add gem to Gemfile ===
case edition
when "community"
  gem "avo", ">= 3.0.1.beta4", source: "https://packager.dev/avo-hq"
when "pro"
  gem "avo-pro", source: "https://packager.dev/avo-hq"
when "advanced"
  gem "avo-advanced", source: "https://packager.dev/avo-hq"
end

gem "ransack"

# === Run bundle install ===
Bundler.with_unbundled_env { run "bundle install" }

file "authenticate :user, lambda { |u| u.developer? } do
  mount Avo::Engine, at: Avo.configuration.root_path
end"

# === Add route ===
route_contents = <<-ROUTES
  # Avo admin panel
  if defined?(Avo::Engine)
    authenticate :user, lambda { |u| u.developer? } do
      mount Avo::Engine, at: Avo.configuration.root_path
    end
  end
ROUTES
route route_contents

# === Copy template files ===
files.each do |path, contents|
  file path, contents
end
