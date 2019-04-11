
class Oystercard
  attr_reader :balance, :in_journey, :entry_station, :exit_station, :journey_history

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
    @entry_station = station
  end

  def touch_out(station)
    deduct(MIN_BALANCE)
    @exit_station = station
    journey_update
  end

  def in_journey?
    !!entry_station
  end

private

  def deduct(amount)
    @balance -= amount
  end

  def journey_update
    journey = {entry: entry_station, exit: exit_station}
    journey_history << journey
  end
end
