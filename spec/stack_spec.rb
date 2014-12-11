require 'stack'
require 'stack_underflow_error'
require 'stack_overflow_error'

describe Stack do
  it 'is empty' do
    expect_stack_size_is 0
  end

  it 'cannot be popped' do
    expect {
      subject.pop
    }.to raise_error StackUnderflowError
  end

  context 'when full' do
    subject { Stack.new 0 }

    it 'cannot be pushed' do
      expect {
        subject.push(:elements)
      }.to raise_error StackOverflowError
    end
  end

  context 'after push' do
    before { subject.push(:elements) }

    it 'has size 1' do
      expect_stack_size_is 1
    end

    it 'has size 0 after pop' do
      subject.pop

      expect_stack_size_is 0
    end

    it 'pops pushed element' do
      popped = subject.pop

      expect(popped).to eq :elements
    end
  end

  context 'with two elements' do
    it 'pops in reversed order' do
      subject.push 1
      subject.push 2

      expect(subject.pop).to eq 2
      expect(subject.pop).to eq 1
    end
  end

  def expect_stack_size_is(expected_size)
    expect(subject.size).to eq expected_size
  end
end