require "riotjs-rails/version"
require "riotjs-rails/sprockets"

module Riot
  module Rails
    if defined?(::Rails) and ::Rails.respond_to?(:version) and Gem::Requirement.new('>= 3.1').satisfied_by?(Gem::Version.new ::Rails.version)
      class Rails::Engine < ::Rails::Engine

        config.after_initialize do |app|
          Riot::Sprockets.register_riotjs app.assets
        end

      end
    end
  end
end
