class House

  attr_reader :price, :address, :rooms

  def initialize(price, address, rooms = [])
    @price = price.delete('$').to_i
    @address = address
    @rooms = rooms
  end

  #splat to accept any number of arguments
  def add_rooms(*rooms)
    @rooms.concat(rooms.flatten)
  end

  def above_market_average?
    if price >= 500000
      return true
    else
      return false
    end
  end


  def rooms_from_category(category)
    @rooms.count { |room| room.category == category }
  end

  def area
    total_area = 0
    @rooms.each do |room|
      total_area += room.area
    end
    total_area
  end

  def details
    {'price' => @price, 'address' => @address}
  end

  def price_per_sf
    (@price.to_f/area).round(2)
  end

  def rooms_sorted_by_area
    rooms.sort_by { |room| room.area }.reverse
  end
end