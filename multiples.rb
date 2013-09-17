class Multiples

  attr_reader :limit

  def initialize(limit, *factors)
    @limit = limit
    @factors = factors
  end

  def better_sum
    sum_factors(@factors) - sum_lcm(@factors)
  end

  def sum_factors(factors)
    total = 0
    factors.each do |factor|
      total += sum_factor(factor)
    end
    total
  end

  def sum_factor(factor)
    factor_total = 0
    co_factor = 1
    while co_factor <= self.multiples(factor)
      factor_total += co_factor * factor
      co_factor += 1
    end
    factor_total
  end

  def multiples(factor)
    multiples = (self.limit - 1) / factor
    multiples.to_i
  end

  def sum_lcm(factors)
    total = 0
    co_factor = 1
    lcm = lcm(factors)
    while co_factor <= self.lcm_multiples(lcm)
      total += co_factor * lcm
      co_factor += 1
    end
    total
  end

  def lcm(factors)
    lcm = factors.inject(:lcm)
  end


  def lcm_multiples(lcm)
    lcm_multiples = (self.limit - 1) / lcm
    lcm_multiples.to_i
  end
end

thousand = Multiples.new(1000, 3, 5)
puts thousand.better_sum
