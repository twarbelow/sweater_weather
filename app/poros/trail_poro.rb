class TrailPoro
  attr_reader :name, :summary, :difficulty, :location, :distance_to_trail

  def initialize(info)
    @name = info[:name]
    @summary = info[:summary]
    @difficulty = info[:difficulty]
    @location = info[:location]
    @distance_to_trail = info[:distance_to_trail]
  end
end
