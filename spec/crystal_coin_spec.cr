require "./spec_helper";
require "../src/crystal_coin/Block";
require "../src/crystal_coin/Transaction";

describe CrystalCoin do
  it "intializes the Coin" do
    coin = CrystalCoin::Block.new transactions: [] of Block.0Transaction;
    coin.transactions.should eq [] of Block.Transaction;
  end

  it "creates the genesis block" do
    puts CrystalCoin::Block.first.inspect;
  end
end
