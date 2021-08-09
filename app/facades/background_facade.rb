class BackgroundFacade
  def self.get_background(location)
    background = BackgroundService.get_image(location)
    BackgroundDetails.new(data)
  end
end
