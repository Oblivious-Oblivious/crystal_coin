require "./ProofOfWork";
require "digest/sha256";

class CrystalCoin::Block
  # NOTE - Testing
  getter data : String;

  include ProofOfWork;

  getter current_hash : String;
  getter index : Int32;
  getter nonce : Int32;
  getter previous_hash : String;

  private def hash_block
    Digest::SHA256.hexdigest "#{@index}#{@timestamp}#{@data}#{@previous_hash}";
  end

  def self.first(data = "Genesis Block")
    Block.new data: data, previous_hash: "0";
  end

  def self.next(previous_block, data = "Transaction Data")
    Block.new(
      data: "Transaction data number (#{previous_block.index + 1})",
      index: previous_block.index + 1,
      previous_hash: previous_block.current_hash,
    )
  end

  def initialize(index = 0, data = "data", previous_hash = "hash")
    @data = data;
    @index = index;
    @timestamp = Time.now;
    @previous_hash = previous_hash;
    @nonce = proof_of_work;
    @current_hash = calc_hash_with_nonce @nonce;
  end
end

