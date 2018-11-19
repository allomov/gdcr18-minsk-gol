class BaseCell
  attr_accessor :x, :y
  def initialize(x, y)
  	@x, @y = x, y
  end

  def value
    0
  end
end

class AliveCell < BaseCell
  def self.instance(*args)
    new(*args)
  end

  
  def to_s
    '*'
  end

  def value
    1
  end
end

class DeadCell < BaseCell
  def self.instance(*args)
    nil
  end

  def to_s
    '.'
  end
end

class NilCell
  def self.instance(*args)
    nil
  end  
end
