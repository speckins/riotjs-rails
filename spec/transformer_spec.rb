require 'riotjs-rails'

RSpec.describe Riot::Sprockets::Transformer do

  it 'responds to :call' do
    expect(subject).to respond_to :call
  end

  it 'returns a compiled tag' do
    expect(subject.call data: <<~TAG).to eq(<<~COMPILED_JAVASCRIPT)
      <test-tag>
        <p>{ greeting }, World.</p>

        <script>
          this.greeting = 'Hello';
        </script>
      </test-tag>
    TAG
      riot.tag2('test-tag', '<p>{greeting}, World.</p>', '', '', function(opts) {
          this.greeting = 'Hello';
      });
    COMPILED_JAVASCRIPT
  end

end
