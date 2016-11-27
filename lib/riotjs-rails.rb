require "riotjs-rails/version"
require "riotjs-rails/sprockets"

module Riot
  module Rails
    if defined?(::Rails) and ::Rails.respond_to?(:version) and Gem::Requirement.new('>= 3.1').satisfied_by?(Gem::Version.new ::Rails.version)
      class Rails::Engine < ::Rails::Engine

        initializer :setup_riotjs do |app|
          config.assets.configure do |env|
            Riot::Sprockets.register_riotjs env
          end
        end

      end
    end
  end
end
