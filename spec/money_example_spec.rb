class Money
  def initialize(amount)
    @amount = amount
  end

  def ==(money)
    amount == money.amount && self.class == money.class
  end

  def self.dollar(amount)
    Dollar.new(amount)
  end

  def self.franc(amount)
    Franc.new(amount)
  end

  alias_method :equals, :==
end

class Dollar < Money
  attr_reader :amount

  def initialize(amount)
    super(amount)
  end

  def times(multiplier)
    self.class.new(amount * multiplier)
  end

end

class Franc < Money
  attr_reader :amount

  def initialize(amount)
    super(amount)
  end

  def times(multiplier)
    self.class.new(amount * multiplier)
  end

end

RSpec.describe "Currency" do
  it "multiplies" do
    five = Money.dollar(5)
    expect(five.times(2)).to eq(Money.dollar(10))
    expect(five.times(3)).to eq(Money.dollar(15))
  end

  it "tests equality" do
    expect(Money.dollar(5).equals(Money.dollar(5))).to be_truthy
    expect(Money.dollar(5).equals(Money.dollar(6))).to be_falsey
    expect(Money.franc(5).equals(Money.franc(5))).to be_truthy
    expect(Money.franc(5).equals(Money.franc(6))).to be_falsey
    expect(Money.franc(5).equals(Money.dollar(5))).to be_falsey
  end
end
