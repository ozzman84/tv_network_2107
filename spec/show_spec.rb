require './lib/character'
require './lib/show'

RSpec.describe Show do
  before :each do
    @kitt           = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    @michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    @knight_rider   = Show.new("Knight Rider", "Glen Larson", [@michael_knight, @kitt])
  end

  it 'exists & has attributes' do
    expect(@knight_rider).to be_a(Show)
    expect(@knight_rider.name).to eq("Knight Rider")
    expect(@knight_rider.creator).to eq("Glen Larson")
    expect(@knight_rider.characters).to eq([@michael_knight, @kitt])
  end

  it 'returns total_salary' do
    expect(@knight_rider.total_salary).to eq(2600000)
  end

  it 'returns highest_paid_actor' do
    expect(@knight_rider.highest_paid_actor).to eq("David Hasselhoff")
  end

  it 'returns actors' do
    expect(@knight_rider.actors).to eq(["David Hasselhoff", "William Daniels"])
  end
end
