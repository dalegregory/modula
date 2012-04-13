require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
%w[
  action_controller
  action_mailer
  active_record
  active_resource
  sprockets
].each { |f| require "#{ f }/railtie" }


if defined?(Bundler)
  Bundler.require(*Rails.groups(assets: %w[ development test ]))
end

module Modula

  module Commands
    RETRIEVE = 'P'
    STORE    = 'V'
  end

  module Operations
    ADD    = 'A'
    DELETE = 'D'
    INSERT = 'I'
  end

  COMMANDS   = [ Commands::RETRIEVE, Commands::STORE ]
  OPERATIONS = [ Operations::ADD, Operations::DELETE, Operations::INSERT ]

  class Application < Rails::Application
    config.active_record.whitelist_attributes = true
    config.assets.enabled                     = true
    config.assets.version                     = '1.0'
    config.autoload_paths                    += %W[ #{ config.root }/lib ]
    config.encoding                           = 'utf-8'
    config.filter_parameters                 += [:password]
    config.i18n.default_locale                = :en
    config.sass.preferred_syntax              = :sass
    config.time_zone                          = 'Pacific Time (US & Canada)'

    config.generators do |g|
      g.assets      false
      g.helper      false
      g.stylesheets false

      g.test_framework :rspec, controller_specs: false,
                               fixture:          false,
                               helper_specs:     false,
                               routing_specs:    false,
                               views:            false,
                               view_specs:       false
    end
  end

end
