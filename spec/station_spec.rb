require 'station'

describe Station do
  let(:station) { double :station }
  let(:zone) { double :zone }
  let(:subject) { described_class.new(station, zone)}

  context 'on initialisation' do
     it 'has a name instance variable' do
       expect(subject.name).to eq station
     end
     it 'has a zone instance variable' do
       expect(subject.zone).to eq zone
     end
   end
 end
