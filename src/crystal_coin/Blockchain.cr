require "./Block";
require "./Transaction";

class CrystalCoin::Blockchain
  BLOCK_SIZE = 25;
  getter chain;
  getter uncommited_transactions;

  def initialize
    @chain = [Block.first];
    @uncommited_transactions = [] of Block::Transaction;
  end

  def add_transaction(transaction)
    @uncommited_transactions << transaction;
  end

  def mine
    if @uncommited_transactions.empty?
      raise "No transactions to be mined";
    else
      @chain << Block.next(
        previous_block: @chain.last,
        transactions: @uncommited_transactions.shift BLOCK_SIZE,
      );
    end
  end
end
