require './lib/room'
require './lib/house'

describe House do

  it 'exists' do
    house = House.new('$400000', "123 sugar lane")

    expect(house.price).to eq(400000)
    expect(house.address).to eq('123 sugar lane')
    expect(house.rooms).to eq([])
  end

  it 'has rooms' do
    house = House.new('$400000', "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')

    house.add_room(room_1)
    house.add_room(room_2)
    expect(house.rooms).to contain_exactly(room_1, room_2)
  end

  it 'checks against market' do
    house1 = House.new('$400000', "123 sugar lane")
    expect(house1.above_market_average?).to eq(false)
    house2 = House.new('$654981', "124 sugar lane")
  end
end