RSpec.shared_examples 'Copy#copy' do
  let(:some_class) { Class.new { include Copy } }

  context 'with one argument' do
    let(:argument) { 123 }

    it 'returns that argument as string' do
      expect(some_class.new.send(method, argument)).to eq(argument.to_s)
    end

    it 'copies that argument as string to system clipboard' do
      expect(some_class.new.send(method, argument)).to eq(Clipboard.paste)
    end
  end

  context 'with two or more arguments' do
    let(:arguments) { [1, 2.0, 'string', /regex/] }

    it "returns a string created by converting each argument to a string, separated by \'\\n\'" do
      expect(some_class.new.send(method, *arguments)).to eq(arguments.map(&:to_s).join("\n"))
    end

    it 'copies a string created by converting each argument to a string, separated by \'\\n\' to system clipboard' do
      expect(some_class.new.send(method, *arguments)).to eq(Clipboard.paste)
    end
  end

  context 'with no arguments' do
    it 'returns the same string as its last call with arguments' do
      some_class.new.send(method, 'string')

      expect(some_class.new.send(method)).to eq('string')
    end
  end
end
