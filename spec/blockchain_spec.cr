require "./spec_helper";
require "../src/crystal_coin/block";

describe "Blockchain" do
  it "tests an initial flow" do
    blockchain = [CrystalCoin::Block.first];
    previous_block = blockchain[0];

    5.times do
      new_block = CrystalCoin::Block.next previous_block: previous_block;
      blockchain << new_block;
      previous_block = new_block;
      puts new_block.inspect;
    end

    blockchain.size.should eq 6;
  end
end
