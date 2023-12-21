require "json";

require "./ProofOfWork";
require "./Transaction";

class CrystalCoin::Block
  include ProofOfWork;
  include JSON::Serializable;

  @[JSON::Field(key: "index")]
  getter index : Int32;

  @[JSON::Field(key: "current_hash")]
  getter current_hash : String;

  @[JSON::Field(key: "nonce")]
  getter nonce : Int32;

  @[JSON::Field(key: "previous_hash")]
  getter previous_hash : String;

  @[JSON::Field(key: "transactions")]
  getter transactions : Array(Transaction);

  @[JSON::Field(key: "timestamp")]
  getter timestamp : String;

  def self.first(data = "Genesis Block")
    Block.new previous_hash: "0";
  end

  def self.next(previous_block, transactions = [] of Transaction)
    Block.new(
      transactions: transactions,
      index: previous_block.index + 1,
      previous_hash: previous_block.current_hash,
    )
  end

  def initialize(
    index = 0,
    transactions = [] of Transaction,
    previous_hash = "hash",
  )
    @index = index;
    @transactions = transactions;
    @previous_hash = previous_hash;
    @timestamp = Time.now;
    @nonce = proof_of_work;
    @current_hash = calc_hash_with_nonce @nonce;
  end

  def recalculate_hash
    @nonce = proof_of_work;
    @current_hash = calc_hash_with_nonce @nonce;
  end
end
