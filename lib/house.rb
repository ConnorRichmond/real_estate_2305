class House

  attr_reader :price, :address, :rooms

  def initialize(price, address, rooms = [])
    @price = price.delete('$').to_i
    @address = address
    @rooms = rooms
  end

  def add_room(data)
    rooms << data
  end

  def above_market_average?
    if price >= 500000
      return true
    else
      return false
    end
  end

end