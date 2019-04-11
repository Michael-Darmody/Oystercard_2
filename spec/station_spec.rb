require 'station'

describe Station do
  let(:station) { double :station }
  let(:zone) { double :zone }
  let(:subject) { described_class.new(station, zone)}

  describe '#name' do
    it 'returns station name' do
      expect(subject.name).to eq(station)
    end
  end

  describe '#zone' do
    it 'returns station zone' do
      expect(subject.zone).to eq zone
    end
  end
end
