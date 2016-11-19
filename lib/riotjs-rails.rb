require "riotjs-rails/version"
require "riotjs-rails/template"

module Riot
  module Rails
    if defined?(::Rails) and Gem::Requirement.new('>= 3.1').satisfied_by?(Gem::Version.new ::Rails.version)
      class Rails::Engine < ::Rails::Engine

        config.after_initialize do |app|
          if app.assets.respond_to? :register_engine
            app.assets.register_engine '.tag', Riot::Rails::Template
          end
        end

      end
    end
  end
end
