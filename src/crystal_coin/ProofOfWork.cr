require "digest/sha256";

module CrystalCoin::ProofOfWork
  private def calc_hash_with_nonce(nonce = 0)
    Digest::SHA256.hexdigest "#{nonce}#{@index}#{@timestamp}#{@data}#{@previous_hash}";
  end

  private def proof_of_work(difficulty = "00")
    nonce = 0;
    loop do
      hash = calc_hash_with_nonce nonce;
      if hash[0..1] == difficulty
        return nonce;
      else
        nonce += 1;
      end
    end
  end
end
