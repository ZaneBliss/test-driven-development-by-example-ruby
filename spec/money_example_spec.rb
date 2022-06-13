class Dollar
  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end

  def times(multiplier)
    self.class.new(amount * multiplier)
  end

  def ==(dollar)
    amount == dollar.amount
  end

  alias_method :equals, :==
end

class Franc
  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end

  def times(multiplier)
    self.class.new(amount * multiplier)
  end

  def ==(dollar)
    amount == dollar.amount
  end

  alias_method :equals, :==
end

RSpec.describe Dollar do
  it "multiplies" do
    five = Dollar.new(5)
    expect(five.times(2)).to eq(Dollar.new(10))
    expect(five.times(3)).to eq(Dollar.new(15))
  end

  it "tests equality" do
    expect(Dollar.new(5).equals(Dollar.new(5))).to be_truthy
    expect(Dollar.new(5).equals(Dollar.new(6))).to be_falsey
  end
end

RSpec.describe Franc do
  it "multiplies" do
    five = Dollar.new(5)
    expect(five.times(2)).to eq(Dollar.new(10))
    expect(five.times(3)).to eq(Dollar.new(15))
  end
end
