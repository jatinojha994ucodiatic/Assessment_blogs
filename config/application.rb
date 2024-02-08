require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Blogs
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    config.before_configuration do
      env_file = File.join(Rails.root, 'config', 'local_env.yml')
      YAML.load(File.open(env_file)).each do |key, value|
        ENV[key.to_s] = value
      end #if File.exists?(env_file)
    end

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    # config.action_controller.raise_on_missing_callback_actions = false
    config.serve_static_assets = true
    config.active_job.queue_adapter = :queue

    # config.cache_store = :redis_store, {
    #   host: 'localhost',
    #   port: 6379,
    #   db: 0,
    #   namespace: '056redis'
    #   }, { expires_in: 90.minutes }
    # config.session_store :cache_store, key: '_your_app_session', expire_after: 1.hour
    config.session_store :redis_store
  end
end
