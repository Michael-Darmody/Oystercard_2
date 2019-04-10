
class Oystercard
attr_reader :balance, :in_journey
alias_method :in_journey?, :in_journey

MAX_BALANCE = 90
MIN_BALANCE = 1

  def initialize(balance = 0)
    @balance = balance
    @in_journey = false
  end

  def top_up(amount)
    raise "Max balance #{MAX_BALANCE} reached" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def touch_in
    raise 'insufficient funds' if @balance < MIN_BALANCE
    @in_journey = true
  end

  def touch_out
    deduct(MIN_BALANCE)
    @in_journey = false
  end

private

  def deduct(amount)
    @balance -= amount
  end

end
