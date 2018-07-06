require_relative 'copy/copy_spec'

RSpec.describe Copy do
  it "has a version number" do
    expect(Copy::VERSION).not_to be nil
  end

  describe '#copy' do
    it_behaves_like 'Copy#copy' do
      let(:method) { :copy }
    end
  end

  describe '#c' do
    it_behaves_like 'Copy#copy' do
      let(:method) { :c }
    end
  end

  describe '#cc' do
    it_behaves_like 'Copy#copy' do
      let(:method) { :cc }
    end
  end
end
