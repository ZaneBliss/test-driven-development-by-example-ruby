class Dollar
  attr_accessor :amount

  def initialize(amount)
    @amount = amount
  end

  def times(multiplier)
    self.class.new(amount * multiplier)
  end

  def equals(dollar)
    amount == dollar.amount
  end
end

RSpec.describe "Money Example" do
  it "multiplies" do
    five = Dollar.new(5)
    product = five.times(2)
    expect(product.amount).to be(10)
    product = five.times(3)
    expect(product.amount).to be(15)
  end

  it "tests equality" do
    expect(Dollar.new(5).equals(Dollar.new(5))).to be_truthy
    expect(Dollar.new(5).equals(Dollar.new(6))).to be_falsey
  end
end
