class Atbash
  ALPHA = ('a'..'z').to_a.join

  def self.encode(secret)
    decode(secret).chars.each_slice(5).map(&:join).join(' ')
  end

  def self.decode(secret)
    secret.downcase.gsub(/\W/, '').tr(ALPHA, ALPHA.reverse)
  end
end
