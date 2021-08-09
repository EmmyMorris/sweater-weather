class BackgroundFacade
  def self.get_image(location)
    background = BackgroundService.get_background(location)
    BackgroundDetails.new(data)
  end
end
