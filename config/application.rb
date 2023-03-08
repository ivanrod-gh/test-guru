require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module TestGuru
  class Application < Rails::Application
    config.load_defaults 6.1

    if ['development', 'test'].include? ENV['RAILS_ENV']
      Dotenv::Railtie.load
    end

    initializer(:remove_action_mailbox_and_activestorage_routes, after: :add_routing_paths) { |app|
      app.routes_reloader.paths.delete_if {|path| path =~ /activestorage/}
      app.routes_reloader.paths.delete_if {|path| path =~ /actionmailbox/ }
    }

    config.time_zone = 'Moscow'
    config.i18n.load_path += Dir[Rails.root.join('config', 'locale', '*.{rb,yml}')]
    config.i18n.available_locales = [:ru, :en]
    config.i18n.default_locale = :ru

    config.autoload_paths << "#{Rails.root}/lib/clients"
  end
end
