class BackgroundSerializer
  include FastJsonapi::ObjectSerializer
  set_type :image
  attributes :id
  attribute :image do |poro|
    {
      location: poro.location,
      image_url: poro.image_url,
      credit: {
        source: poro.source,
        author: poro.author,
        logo: poro.logo
      }
    }
  end
end
