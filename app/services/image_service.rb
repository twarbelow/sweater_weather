class ImageService
  def self.search_images(location)
    response = conn.get("api/?q=#{location}&image_type=photo&safesearch=true")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(
      url: 'https://pixabay.com',
      params: {
        key: ENV['PIXABAY_API_KEY']
      },
      headers: {
        'Content-Type' => 'application/json'
      }
    )
  end
end
