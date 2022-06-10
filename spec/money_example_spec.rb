class Dollar
  attr_accessor :amount

  def initialize(amount)
    @amount = amount
  end

  def times(multiplier)
    self.class.new(amount * multiplier)
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
end
