# Avo 3 Solid Queue template

## What's happening?

<!-- 1. Add to the `Gemfile`. Possibly to show a choice for `avo`, `pro` or `advanced`. `gem "avo", ">= 3.0.1.beta4", source: "https://packager.dev/avo-hq"`
1. Run `bundle install`
1. Add the route `mount Avo::Engine, at: Avo.configuration.root_path`
1. Copy the `template` files -->

### Add this to your `avo.rb` initializer

```ruby
  config.main_menu = -> {
    section "Dashboards", icon: "dashboards" do
      all_dashboards
    end

    section "Solid Queue", icon: "queue-list" do
      resource :solid_queue_jobs, label: "Jobs"
      resource :solid_queue_failed_execution, label: "Failed executions"
      resource :solid_queue_processes, label: "Processes"
    end
  }
```


