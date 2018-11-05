module Cryptography

  def check_date(date)
    if date.class == Time
      date.strftime("%m%d%y")
    else
      date
    end
  end

  def check_key(key)
    until key.length == 5
      key.insert(0, '0')
    end
    key
  end
end
