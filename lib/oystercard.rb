
class Oystercard
  attr_reader :balance, :in_journey, :journey_history

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize(balance = 0)
    @balance = balance
    @journey_history = []
  end

  def top_up(amount)
    raise "Max balance #{MAX_BALANCE} reached" if balance + amount > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    raise 'insufficient funds' if balance < MIN_BALANCE
    start_journey(station)
  end

  def touch_out(station)
    deduct(MIN_BALANCE)
    end_journey(station)
  end

  def in_journey?
    return false if journey_history.empty?
    journey_history.last.has_key?(:exit) ? false : true
  end

private

  def deduct(amount)
    @balance -= amount
  end

  def start_journey(station)
    journey_history << {entry: station}
  end

  def end_journey(station)
    journey = journey_history.last
    journey[:exit] = station
    journey_history[-1] = journey
  end
end
