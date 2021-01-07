class Quote < ApplicationRecord

  def self.random
    self.order(Arel.sql("RANDOM()")).first
  end
end
