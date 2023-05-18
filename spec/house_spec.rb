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

    house.add_rooms(room_1)
    house.add_rooms(room_2)
    expect(house.rooms).to contain_exactly(room_1, room_2)
  end

  it 'checks against market' do
    house1 = House.new('$400000', "123 sugar lane")
    expect(house1.above_market_average?).to eq(false)

    house2 = House.new('654981', "124 sugar lane")
    expect(house2.above_market_average?).to eq(true)
  end

  it 'checks for rooms in category' do
    house = House.new('234255346', '155 big money ln')

    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')

    house.add_rooms(room_1, room_2, room_3, room_4)
    expect(house.rooms).to contain_exactly(room_1, room_2, room_3, room_4)

    expect(house.rooms_from_category(:bedroom)).to eq(2)
    expect(house.rooms_from_category(:living_room)).to eq(1)
    expect(house.rooms_from_category(:basement)).to eq(1)
  end

  it 'shows total area of house' do
    house = House.new('234255346', '155 big money ln')

    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')

    house.add_rooms(room_1, room_2, room_3, room_4)

    expect(house.area).to eq(1900)
  end

  it 'gives details' do
    house = House.new('234255346', '155 big money ln')

    expect(house.details).to eq({'price' => 234255346, 'address' => '155 big money ln'})
  end
end