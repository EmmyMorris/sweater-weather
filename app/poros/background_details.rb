class BackgroundDetails
  attr_reader :id,
              :location,
              :image_url,
              :credit

  def initialize(background, location)
    @id = nil
    @location = location
    @image_url = background[:results][0][:urls][:regular]
    @credit = {
              source: 'unsplash.com',
              author: background[:results][0][:user][:username],
              logo: background[:results][0][:user][:profile_image][:medium]
              }
  end
end
