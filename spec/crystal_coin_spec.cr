require "./spec_helper";
require "../src/crystal_coin/Block";
require "../src/crystal_coin/Transaction";

describe CrystalCoin do
  it "creates the genesis block" do
    puts CrystalCoin::Block.first.inspect;
  end
end
