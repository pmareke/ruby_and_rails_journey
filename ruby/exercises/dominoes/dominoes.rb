Domino = Struct.new(:a, :b, :used)

class Dominoes

  def self.chain?(dominoes)
    return true if dominoes.empty?

    return dominoes.first[0] == dominoes.first[1] if dominoes.size == 1

    dominoes.map! { |(a, b)| Domino.new(a, b, false) }
    generate_chain(dominoes, [])
  end

  private

  def self.generate_chain(available, stack)
    available.select!{ |d| d.used == false }
    return true if available.size == 0

    last = stack.last || available.first
    last.used = true
    candidates = available.select { |d| d.a == last.b || d.b == last.b }
    candidates.any? do |candidate|
      stack << candidate
      generate_chain(available, stack)
    end
  end
end
