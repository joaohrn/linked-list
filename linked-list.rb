class Node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
  attr_accessor :next_node, :value

  def to_s
    value.to_s
  end
end

class LinkedList
  def initialize(value = nil)
    @head = Node.new value
    @tail = @head
  end

  attr_reader :head, :tail

  def append(value)
    new_node = Node.new value
    if head.value.nil?
      @head = new_node
    else
      @tail.next_node = new_node
    end
    @tail = new_node
  end

  def prepend(value)
    new_node = Node.new value
    new_node.next_node = @head
    @head = new_node
  end

  def size
    size = 0
    iterator = @head
    until iterator.nil?
      size += 1
      iterator = iterator.next_node
    end
    size
  end

  def at(index)
    position = 0
    node = @head
    until position == index
      node = node.next_node
      position += 1
    end
    node
  end

  def pop
    if @head == @tail
      @tail = nil
      @head = nil
    else
      iterator = @head
      iterator = iterator.next_node until iterator.next_node == @tail

      iterator.next_node = nil
      @tail = iterator
    end
  end

  def contains(value)
    iterator = @head
    until iterator.nil?
      return true if iterator.value == value

      iterator = iterator.next_value
    end
    false
  end

  def find(value)
    position = 0
    iterator = @head
    until iterator.nil?
      return position if iterator.value == value

      position += 1
      iterator = iterator.next_node
    end
    nil
  end

  def to_s
    iterator = @head
    str = ''
    until iterator.nil?
      str += "(#{iterator})->"
      iterator = iterator.next_node
    end
    str += 'nil'
    str
  end
end
linked_list = LinkedList.new
linked_list.append 8
linked_list.append 5
linked_list.append 6
linked_list.append 2
linked_list.append 3
linked_list.prepend 9
puts linked_list
puts linked_list.size
puts linked_list.at(0)
