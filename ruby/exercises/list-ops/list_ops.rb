class ListOps
  def self.arrays(arr)
    size = 0
    for item in arr
      size += 1
    end
    size
  end

  def self.reverser(arr)
    result= []
    for idx in (arr.size - 1).downto(0)
      result.push(arr[idx])
    end
    result
  end

  def self.concatter(arr_1, arr_2)
    arr_1 + arr_2
  end

  def self.mapper(arr, &block)
    result = []
    for item in arr
      result.push(yield(item))
    end
    result
  end

  def self.filterer(arr, &block)
    result = []
    for item in arr
      if yield(item)
        result.push(item)
      end
    end
    result
  end

  def self.sum_reducer(arr)
    result = 0
    for item in arr
      result += item
    end
    result
  end

  def self.factorial_reducer(arr)
    result = 1
    for item in arr
      result *= item
    end
    result
  end
end