class Encryption
  attr_reader :key
  def initialize(message, key = rand(1..99999).to_s, date)
    @message = message
    @key = check_key(key)
    @date = date
  end

  def check_key(key)
    loop do
      if key.length < 5
        key.insert(0, '0')
      else
        break
      end
    end
    key
  end

  def create_rotation_gourps
    split = @key.split(//)
    [(split[0] + split[1]).to_i, (split[1] + split[2]).to_i,
    (split[2] + split[3]).to_i, (split[3] + split[4]).to_i]
  end

  def create_offsets
    date_square = @date.to_i ** 2
    offset = (date_square % 10000).to_s.split(//)
    offset.collect{|num| num.to_i}
  end

  def create_encryption_key
    create_rotation_gourps.zip(create_offsets).map do |key|
      key.sum
    end
  end

end
