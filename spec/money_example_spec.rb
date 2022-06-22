class Money
  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def ==(money)
    amount == money.amount && self.class == money.class
  end

  def self.dollar(amount)
    Dollar.new(amount, "USD")
  end

  def self.franc(amount)
    Franc.new(amount, "CHF")
  end

  alias_method :equals, :==
end

class Dollar < Money
  attr_reader :amount, :currency

  def initialize(amount, currency)
    super(amount, currency)
  end

  def times(multiplier)
    Money.dollar(amount * multiplier)
  end
end

class Franc < Money
  attr_reader :amount, :currency

  def initialize(amount, currency)
    super(amount, currency)
  end

  def times(multiplier)
    Money.franc(amount * multiplier)
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

  it "converts" do
    expect(Money.dollar(1).currency).to eq("USD")
    expect(Money.franc(1).currency).to eq("CHF")
  end
end
