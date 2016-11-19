require 'riotjs-rails/javascript_compiler'

module Riot
  module Sprockets
    module Transformer
      def self.call(input)
        Riot::Rails::JavascriptCompiler.new.compile input[:data]
      end
    end
  end
end
