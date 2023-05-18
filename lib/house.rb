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
end