require 'sprockets'
require 'riotjs-rails/template'
require 'riotjs-rails/sprockets/transformer'

module Riot
  module Sprockets

    def self.register_riotjs(env)
      # Sprockets 4
      if env.respond_to? :register_transformer
        env.register_mime_type   'riot/tag', extensions: ['.tag']
        env.register_transformer 'riot/tag', 'application/javascript', Riot::Sprockets::Transformer

      # Sprockets 2/3
      elsif env.respond_to? :register_engine
        if ::Sprockets::VERSION.start_with? '3.'
          env.register_engine '.tag', Riot::Rails::Template, mime_type: 'riot/tag', silence_deprecation: true
        else
          env.register_engine '.tag', Riot::Rails::Template
        end
      end
    end

  end
end
