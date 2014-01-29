def map &block
  temp = []
  i = 0
  each do |element| 
      temp[i]  = yield element
  i += 1
  end
  temp
  end


map! &block
  each do |element|
  @internal_arr[i] = yield element
  i += 1
  end
  @interal_arr  #calling back the modified arr
end


def find &block
  i = 0
  found = nil
  each do |comparison|
      if yield comparison
           return comparison
      end
      nil
  end



found = internal_arr[i] if yield comparison
  i+=1
  end
  found
  end


def inject acc=nil, &block
     if acc == nil
         acc = @interal_arr[0]
          i = 1
     else
     i =0
end 

     while i < @internal_arr.length
          acc = yield acc, @internal_arr[i]
          i += 1
     end
          acc
     end
end