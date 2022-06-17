class Money
  def initialize(amount)
    @amount = amount
  end

  def ==(money)
    amount == money.amount && self.class == money.class
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
    five = Dollar.new(5)
    expect(five.times(2)).to eq(Dollar.new(10))
    expect(five.times(3)).to eq(Dollar.new(15))
  end

  it "tests equality" do
    expect(Dollar.new(5).equals(Dollar.new(5))).to be_truthy
    expect(Dollar.new(5).equals(Dollar.new(6))).to be_falsey
    expect(Franc.new(5).equals(Franc.new(5))).to be_truthy
    expect(Franc.new(5).equals(Franc.new(6))).to be_falsey
  end
end
