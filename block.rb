class Block
  attr_reader :id, :timer

  def initialize(id, timer)
    @id = id
    @timer = timer
  end

  def compute_hash_with_proof_of_work(difficulty)
    nonce = 0
    loop do
      hash = calc_hash_with_nonce(nonce)
      if hash.start_with?(difficulty)
        return [nonce, hash]
      else
        nonce += 1
      end
    end
  end

  def calc_hash_with_nonce(nonce = 0)
    sha = Digest::SHA256.new
    sha.update(nonce.to_s + @id.to_s + @timer.to_s)
    sha.hexdigest
  end

  def self.first(timer)
    random_hash = Digest::SHA256.hexdigest(rand.to_s)
    difficulty = random_hash[0, 2]
    Block.new(0, timer)
  end

  def self.next(previous, timer)
    Block.new(previous.id + 1, timer)
  end
end  # class Block