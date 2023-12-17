require "./spec_helper";
require "../src/crystal_coin/block";

describe CrystalCoin do
  it "intializes the Coin" do
    coin = CrystalCoin::Block.new data: "Hello, Cryptos!";
    coin.data.should eq("Hello, Cryptos!");
  end

  it "does not produce the same hash with multiple blocks" do
    c1 = CrystalCoin::Block.new data: "Hello, Cryptos!";
    c2 = CrystalCoin::Block.new data: "Hello, Cryptos!";
    (c1.current_hash != c2.current_hash).should eq true;
  end

  it "creates the genesis block" do
    pp CrystalCoin::Block.first;
  end
end
