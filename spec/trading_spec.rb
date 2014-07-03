require 'rspec'
require_relative '../lib/bter.rb'

RSpec.configure do |c|
  #skip tests that run for each pair on every method
  c.filter_run_excluding :slow => true
end

describe Bter::Trade do
  before :all do
    @bt = Bter::Trade.new
    @pairs = Bter::Public.new.pairs
    #supply a key and secret here if needed
    @bt.key = ''
    @bt.secret = ''
  end

  describe :get_info do
	it "should return a Hash" do
	  expect(@bt.get_info).to be_a Hash
	end
	it "should not be empty" do
	  expect(@bt.get_info).not_to be_empty
	end
  end

  describe :active_orders do
	it "should return a Hash" do
	  expect(@bt.active_orders).to be_a Hash
	end
	it "should not be empty" do
	  expect(@bt.active_orders).not_to be_empty
	end
  end

  describe :order_status do
	it "should return a Hash" do
	  expect(@bt.order_status(123456)).to be_a Hash
	end
	it "should not be empty" do
	  expect(@bt.order_status(123456)).not_to be_empty
	end
  end

  describe :cancel_order do
	it "should return a Hash" do
	  expect(@bt.cancel_order(123456)).to be_a Hash
	end
	it "should not be empty" do
	  expect(@bt.cancel_order(123456)).not_to be_empty
	end
  end
  describe :my_trades_all , :slow => true do
	it "should return a hash" do
	  @pairs.each do |pair|
	    expect(@bt.my_trades(pair)).to be_a Hash
	  end
	end
	it "should not be empty" do
	  @pairs.each do |pair|
	    expect(@bt.my_trades(pair)).not_to be_empty
	  end
	end
  end

  describe :my_trades do
	it "should return a hash" do
	  pair = @pairs.sample
	  expect(@bt.my_trades(pair)).to be_a Hash
	end
	it "should not be empty" do
	  pair = @pairs.sample
	  expect(@bt.my_trades(pair)).not_to be_empty
	end
  end

  describe :buy_with_rate do
	it "should return a hash" do
	  pair = @pairs.sample
	  amount = Random.new.rand(1..500)
	  rate = Random.new.rand(1.0..500.0)
	  expect(@bt.buy(pair, amount, rate)).to be_a Hash
	end
	it "should not be empty" do
	  pair = @pairs.sample
	  amount = Random.new.rand(1..500) 
	  rate = Random.new.rand(1.0..500.0)
	  expect(@bt.buy(pair, amount, rate)).not_to be_empty
	end
  end

  describe :buy_without_rate do
	it "should return a hash" do
	  pair = @pairs.sample
	  amount = Random.new.rand(1..500) 
	  expect(@bt.buy(pair, amount)).to be_a Hash
	end
	it "should not be empty" do
	  pair = @pairs.sample
	  amount = Random.new.rand(1..500) 
	  expect(@bt.buy(pair, amount)).not_to be_empty
	end
  end

  describe :sell_with_rate do
	it "should return a hash" do
	  pair = @pairs.sample
	  amount = Random.new.rand(1..500)
	  rate = Random.new.rand(1.0..500.0)
	  expect(@bt.sell(pair, amount, rate)).to be_a Hash
	end
	it "should not be empty" do
	  pair = @pairs.sample
	  amount = Random.new.rand(1..500) 
	  rate = Random.new.rand(1.0..500.0)
	  expect(@bt.sell(pair, amount, rate)).not_to be_empty
	end
  end

  describe :sell_without_rate do
	it "should return a hash" do
	  pair = @pairs.sample
	  amount = Random.new.rand(1..500) 
	  expect(@bt.sell(pair, amount)).to be_a Hash
	end
	it "should not be empty" do
	  pair = @pairs.sample
	  amount = Random.new.rand(1..500) 
	  expect(@bt.sell(pair, amount)).not_to be_empty
	end
  end

  describe :get_rate do
  	it "should be a number" do
  	  pair = @pairs.sample
  	  expect(@bt.send(:get_rate, pair)).to be > 0
  	end
  end

end