require 'rspec'
require_relative '../lib/bter.rb'

RSpec.configure do |c|
  #skip tests that run for each pair on every method
  c.filter_run_excluding :slow => true
end

describe Bter::Public do
  before :all do
    @bt = Bter::Public.new
    @pairs = Bter::Public.new.pairs
  end

  describe :pairs do
	it "should return an array" do
	  expect(@bt.pairs).to be_a Array
	end
	it "should not be empty" do
	  expect(@bt.pairs).not_to be_empty
	end
  end

  describe :tickers do
	it "should return a hash" do
	  expect(@bt.tickers).to be_a Hash
	end
	it "should not be empty" do
	  expect(@bt.tickers).not_to be_empty
	end
  end

  describe :ticker_all , :slow => true do
	it "should return a hash" do
	  @pairs.each do |pair|
	    expect(@bt.ticker(pair)).to be_a Hash
	  end
	end
	it "should not be empty" do
	  @pairs.each do |pair|
	    expect(@bt.ticker(pair)).not_to be_empty
	  end
	end
  end

  describe :ticker do
	it "should return a hash" do
	  pair = @pairs.sample
	  expect(@bt.ticker(pair)).to be_a Hash
	end
	it "should not be empty" do
	  pair = @pairs.sample
	  expect(@bt.ticker(pair)).not_to be_empty
	end
  end

  describe :depth_all , :slow => true do
	it "should return a hash" do
	  @pairs.each do |pair|
	    expect(@bt.depth(pair)).to be_a Hash
	  end
	end
	it "should not be empty" do
	  @pairs.each do |pair|
	    expect(@bt.depth(pair)).not_to be_empty
	  end
	end
  end

  describe :depth do
	it "should return a hash" do
	  pair = @pairs.sample
	  expect(@bt.depth(pair)).to be_a Hash
	end
	it "should not be empty" do
	  pair = @pairs.sample
	  expect(@bt.depth(pair)).not_to be_empty
	end
  end

  describe :info do
	it "should return a hash" do
	  expect(@bt.info).to be_a Hash
	end
	it "should not be empty" do
	  expect(@bt.info).not_to be_empty
	end
  end 

  describe :details do
	it "should return a hash" do
	  expect(@bt.details).to be_a Hash
	end
	it "should not be empty" do
	  expect(@bt.details).not_to be_empty
	end
  end

  describe :trades_without_tid_all, :slow => true do
	it "should return a hash" do
	  @pairs.each do |pair|
	    expect(@bt.trades(pair)).to be_a Hash
	  end
	end
	it "should not be empty" do
	  @pairs.each do |pair|
	    expect(@bt.trades(pair)).not_to be_empty
	  end
	end 
	it "should return 80 or less results" do
	  @pairs.each do |pair|
	    expect(@bt.trades(pair).count).to be <= 80
	  end
	end	
  end

  describe :trades_without_tid do
	it "should return a hash" do
	  pair = @pairs.sample
	  expect(@bt.trades(pair)).to be_a Hash
	end
	it "should not be empty" do
	  pair = @pairs.sample
	  expect(@bt.trades(pair)).not_to be_empty
	end 
	it "should return 80 or less results" do
	  pair = @pairs.sample
	  expect(@bt.trades(pair).count).to be <= 80
	end	
  end

  describe :trades_with_tid_all, :slow => true  do
	it "should return a hash" do
	  pair = @pairs.sample
	  @pairs.each do |pair|
	  	tid = Random.new.rand(1..100) 
	    expect(@bt.trades(pair, tid)).to be_a Hash
	  end
	end
	it "should not be empty" do
	  pair = @pairs.sample
	  @pairs.each do |pair|
	  	tid = Random.new.rand(1..100) 
	    expect(@bt.trades(pair, tid)).not_to be_empty
	  end
	end 
  end

  describe :trades_with_tid do
	it "should return a hash" do
	  pair = @pairs.sample
	  tid = Random.new.rand(1..100) 
	  expect(@bt.trades(pair, tid)).to be_a Hash
	end
	it "should not be empty" do
	  pair = @pairs.sample
	  tid = Random.new.rand(1..100) 
	  expect(@bt.trades(pair, tid)).not_to be_empty
	end 
  end	

end