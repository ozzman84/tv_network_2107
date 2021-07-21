require './lib/network'
# => true

require './lib/show'
# => true

require './lib/character'
# => true

RSpec.describe Network do
  before :each do
    @nbc = Network.new("NBC")
    # => #<Network:0x00007fe5f83ea3b0...>
    @michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    # => #<Character:0x00007fe5f88721f8...>

    @kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    # => #<Character:0x00007fe5f8448f78...>

    @knight_rider = Show.new("Knight Rider", "Glen Larson", [@michael_knight, @kitt])
    # => #<Show:0x00007fe5f8398970...>

    @leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    # => #<Character:0x00007fe5f832bb18...>

    @ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    # => #<Character:0x00007fe5f8172a60...>

    @parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [@leslie_knope, @ron_swanson])
    # => #<Show:0x00007fe5f88b0a20...>

    @mitch = Character.new({name: "Mitch Buchannon", actor: "David Hasselhoff", salary: 1_200_000})
    # => #<Character:0x00007fe5f8448f78...>

    @baywatch = Show.new("Baywatch", "Gregory Bonann", [@mitch])
    # => #<Show:0x00007fe5f8398970...>
  end

  it 'exists & has attributes' do
    expect(@nbc).to be_a(Network)
    expect(@nbc.name).to eq("NBC")
    expect(@nbc.shows).to eq([])
  end

  describe 'adding shows' do
    before :each do
      @nbc.add_show(@knight_rider)
      @nbc.add_show(@parks_and_rec)
    end

    it 'returns shows' do
      expect(@nbc.shows).to eq([@knight_rider, @parks_and_rec])
    end

#A character is a main character for the network if their salary is greater than 500_000 and their character name has no lowercase letters.
    it 'returns characters' do
      expect(@nbc.main_characters).to eq([@kitt])
    end

    it 'returns actors_by_show' do
      expect(@nbc.actors_by_show).to eq({
        @knight_rider => ["David Hasselhoff", "William Daniels"],
        @parks_and_rec => ["Amy Poehler", "Nick Offerman"]
      })
    end

    it 'returns shows_by_actor' do
      @nbc.add_show(@baywatch)

      expect(@nbc.shows_by_actor).to eq({
        "David Hasselhoff" => [@knight_rider, @baywatch],
        "William Daniels" => [@knight_rider],
        "Amy Poehler" => [@parks_and_rec],
        "Nick Offerman" => [@parks_and_rec]
      })
    end

    it 'returns prolific_actors' do
      @nbc.add_show(@baywatch)

      expect(@nbc.prolific_actors).to eq(["David Hasselhoff"])
    end
  end
end
