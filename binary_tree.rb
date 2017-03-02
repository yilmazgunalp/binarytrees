class Node
  attr_accessor :value, :left, :right, :parent
  def initialize value, left=nil ,right=nil ,parent=nil
  @value = value
  @left = left
  @right = right 
  @parent = parent
  end
  
  def to_s 
  @value
  end  
  def inspect 
    puts "   #{@parent.to_s}\n   #{@value}\n \/   \\ \nL:#{@left.to_s}     R:#{@right.to_s}"
    end  
  end  


  

def build_tree arr 
  root = Node.new(arr.slice!(arr.length/2,1)[0])  

  def populate root,value 
    
          if value <= root.value
            if root.left.nil?
            root.left = Node.new(value)
            root.left.parent = root
            elsif root.left.value < value
            root.left = Node.new(value,root.left,nil, root)
            root.left.left.parent = root.left
            else
            populate root.left,value
            end
          else 
            if root.right.nil?
            root.right = Node.new(value)
            root.right.parent = root
            elsif root.right.value > value
            root.right = Node.new(value,nil, root.right,root)
            root.right.right.parent = root.right
            else
            populate root.right,value  
            end
          end 
          # puts root.inspect
  end 
  
  arr.each  {|value| populate(root,value)}
  root
end  



 
 
def traverse root 
  if  root != nil 
      puts root.inspect
      traverse root.left
      traverse root.right
  end
  end  


def breadth_first_search root,value, queue=[]
  if root.nil? 
  return nil
  end
  
  if value == root.value
    puts "found it!"
    return root 
  else
    queue << root.left if !root.left.nil? 
    queue << root.right if !root.right.nil? 
  end
  while !queue.empty?
  y = queue.shift
  
  return breadth_first_search(y,value, queue)   
  end

  end



def dfs_rec root,value
  if root.value.nil?
  return nil  
  elsif
   root.value == value
  return root
  end
  puts root.inspect
  
  if value <= root.value
  dfs_rec root.left,value  
  else
  dfs_rec root.right, value
  end
  end   


arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324,2,-6,0,-9,66,35,15,317]  
x = build_tree arr

dfs_rec(x,324)
