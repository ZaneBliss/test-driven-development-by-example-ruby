class Dollar
  attr_accessor :amount

  def initialize(amount)
    @amount = amount
  end

  def times(multiplier)
    @amount *= multiplier
  end
end

RSpec.describe "Money Example" do
  it "multiplies" do
    five = Dollar.new(5)
    five.times(2)
    expect(10).to be(five.amount)
  end
end
