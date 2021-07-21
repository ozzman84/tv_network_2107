class Network
  attr_reader :name,
              :shows

  def initialize(name)
    @name  = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def main_characters
    main_characters = []
    @shows.each do |show|
      show.characters.each do |character|
        main_characters << character if character.salary > 500_000 && character.name == character.name.upcase
      end
    end
    main_characters
  end

  def actors_by_show
    actors_by_show = Hash.new { |h, k| h[k] = [] }
    @shows.each do |show|
      show.characters.each do |character|
        actors_by_show[show] << character.actor
      end
    end
    actors_by_show
  end

  def shows_by_actor
    shows_by_actor = Hash.new { |h, k| h[k] = [] }
    @shows.each do |show|
      show.characters.each do |character|
        shows_by_actor[character.actor] << show
      end
    end
    shows_by_actor
  end

  def prolific_actors
    show_count = Hash.new(0)
    prolific_actors = []
    @shows.each do |show|
      show.actors.each do |actor|
        show_count[actor] += 1
      end
      show_count.map do |key, value|
        prolific_actors << key if value > 1
      end
    end
    prolific_actors
  end
end
