
class Oystercard
attr_reader :balance, :in_journey, :entry_station

MAX_BALANCE = 90
MIN_BALANCE = 1

  def initialize(balance = 0)
    @balance = balance

  end

  def top_up(amount)
    raise "Max balance #{MAX_BALANCE} reached" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    raise 'insufficient funds' if @balance < MIN_BALANCE
    @entry_station = station

  end

  def touch_out
    deduct(MIN_BALANCE)
    @entry_station = nil
  end

  def in_journey?
    !!@entry_station
  end

private

  def deduct(amount)
    @balance -= amount
  end

end
