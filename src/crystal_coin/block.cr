require "digest/sha256";

module CrystalCoin
  class Block
    # NOTE - Testing
    getter data;

    property current_hash : String;
    getter index : Int32;

    private def hash_block
      Digest::SHA256.hexdigest "#{@index}#{@timestamp}#{@data}#{@previous_hash}";
    end

    def self.first(data = "Genesis Block")
      Block.new(data: data, previous_hash: "0");
    end

    def initialize(
      index = 0,
      data = "data",
      previous_hash = "hash",
    )
      @data = data;
      @index = index;
      @timestamp = Time.now;
      @previous_hash = previous_hash;
      @current_hash = hash_block;
    end
  end
end
