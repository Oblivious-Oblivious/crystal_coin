class CrystalCoin::Block
  class Transaction
    getter from : String;
    getter to : String;
    getter amount : Int32;

    def initialize(@from, @to, @amount) end
  end
end
