require 'Oystercard'

describe Oystercard do
  describe '#balance' do
    it 'returns a balance' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#top_up' do
    it "tops up the balance" do
      expect { subject.top_up(10) }.to change{ subject.balance }.by 10
    end

    context 'if balance exceeds £90' do
      it 'raises an error' do
        maximum_balance = Oystercard::MAX_BALANCE
        subject.top_up(maximum_balance)
        expect { subject.top_up(1) }.to raise_error "Max balance #{maximum_balance} reached"
      end
    end
  end

  # describe '#deduct' do
  #   it "subtracts the journey amount from the balance" do
  #     subject.top_up(50)
  #     expect { subject.deduct(10) }.to change{ subject.balance }.by -10
  #   end
  # end

  describe '#in_journey?' do
    context 'new oystercards' do
      it { is_expected.not_to be_in_journey}
    end
    context 'when touched in' do
      it "returns true" do
        subject.top_up(10)
        subject.touch_in
        expect(subject).to be_in_journey
      end
      it 'raises an error when balance is below 0' do
        expect{ subject.touch_in }.to raise_error 'insufficient funds'
      end
    end
    context 'when touched out' do
      it "returns false" do
        subject.touch_out
        expect(subject).not_to be_in_journey
      end
    context 'when touching out, deducts fair from balance' do
      it 'deducts 1 from balance' do
        expect{ subject.touch_out }.to change{ subject.balance }.by -Oystercard::MIN_BALANCE
        end
      end
    end
  end
end
