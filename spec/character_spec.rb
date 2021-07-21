require './lib/character'
# => true

RSpec.describe Character do
  before :each do
    @kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
  end

  it 'exists & has attributes' do
    expect(@kitt).to be_a(Character)
    expect(@kitt.name).to eq("KITT")
    expect(@kitt.actor).to eq("William Daniels")
    expect(@kitt.salary).to eq(1000000)
  end
end
