require "./Block";
require "./Transaction";

class CrystalCoin::Blockchain
  getter chain;
  getter uncommited_transactions;

  def initialize
    @chain = [Block.first];
    @uncommited_transactions = [] of Block::Transaction;
  end

  def add_transaction(transaction)
    @uncommited_transactions << transaction;
  end
end
