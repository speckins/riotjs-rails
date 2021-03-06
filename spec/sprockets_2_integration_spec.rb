require 'riotjs-rails'

if Sprockets::VERSION.start_with? '2.'
  RSpec.describe 'Sprockets 2 compatibility' do

    let(:sprockets_env) {
      Sprockets::Environment.new('.').tap { |env|
        Riot::Sprockets.register_riotjs env
        env.append_path 'spec/fixtures'
      }
    }

    describe 'compiled asset' do

      subject { sprockets_env['test'] }

      it 'finds the asset' do
        expect(subject).to_not be_nil
      end

      it 'has a content type of "application/javascript"' do
        expect(subject.content_type).to eq 'application/javascript'
      end

      it 'compiles' do
        expect(subject.to_s).to eq(<<~COMPILED_JAVASCRIPT)
          riot.tag2('test-tag', '<p>{greeting}, World.</p>', '', '', function(opts) {
          \t\tthis.greeting = 'Hello';
          });
        COMPILED_JAVASCRIPT
      end
    end

  end
end
