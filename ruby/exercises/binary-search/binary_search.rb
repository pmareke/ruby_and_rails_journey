class BinarySearch
  def initialize(items)
    @items = items
  end

  def search_for(item)
    first_index = 0
    last_index = @items.size - 1

    while first_index <= last_index
      middle_index = (first_index + last_index).div(2)

      return middle_index if @items[middle_index] == item

      if @items[middle_index] > item
        last_index = middle_index - 1 
      else
        first_index = middle_index + 1
      end
    end
    nil
  end
end
