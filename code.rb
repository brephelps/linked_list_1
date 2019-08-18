class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end

####### create stack ########

class Stack
  attr_accessor :data

  def initialize
    @data = nil
  end

  # Push a value onto the stack
  def push(new_value)
    @data = LinkedListNode.new(new_value, @data)
  end

  # Pop an item off the stack.
  # Remove the last item that was pushed onto the
  # stack and return the value to the user
  def pop
    # check if stack is empty
    if @data.nil?
      return "nil"
    elsif @data.next_node != nil
      value = @data.value
      @data = @data.next_node
      return value
    else
      value = @data.value
      @data = @data.next_node
      return value
    end
  end
end

def reverse_list(list_node)
  stack = Stack.new
  final_stack = Stack.new

  while list_node
    # need to parse out the value to only input that to Push
    stack.push(list_node.value)
    # iterate to the next node by mapping .next_node to current data id
    list_node = list_node.next_node
  end
  
    while stack.data
      # need to create a new list with the popped values
      final_stack = LinkedListNode.new(stack.pop, stack.data)
      # return final list 
      return final_stack
    end
end



node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

print_values(node3)

puts "-------"

revlist = reverse_list(node3)
print_values(revlist)

