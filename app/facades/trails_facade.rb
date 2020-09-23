class TrailsFacade
  def self.get_trails(lat, long)
    response = TrailsService.nearby_trails(lat, long)
    trails = response[:trails].map do |trail|
      TrailPoro.new(trail)
    end
    # need to take location from each trail along with original location and do mapquest directions
  end
end
