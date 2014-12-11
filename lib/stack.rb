class Stack

  def initialize(capacity=99)
    @capacity = capacity
    @elements = []
  end
  
  def size
    @elements.size
  end

  def push(element)
    raise StackOverflowError.new if full?
    @elements.push element
  end

  def pop
    raise StackUnderflowError.new if empty?
    @elements.pop
  end

  private

  def full?
    size == @capacity
  end

  def empty?
    size == 0
  end
end