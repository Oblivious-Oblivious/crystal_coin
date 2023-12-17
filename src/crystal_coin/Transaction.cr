require "json";

class CrystalCoin::Block
  class Transaction
    include JSON::Serializable;
    
    @[JSON::Field(key: "from")]
    property from : String;

    @[JSON::Field(key: "to")]
    property to : String;

    @[JSON::Field(key: "amount")]
    property amount : Int64;

    def initialize(@from, @to, @amount) end
  end
end
