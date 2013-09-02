require 'flickraw'

class Uploader

  attr_accessor :creds, :flickr, :my_photo_titles, :my_sets

  def initialize
    FlickRaw.api_key = '08ca5c200381d9ffbd7411a8e7377dd6'
    FlickRaw.shared_secret = 'a246519777c0069f'

    @flickr = FlickRaw::Flickr.new

    @creds = {"fullname"=>nil,
     "oauth_token"=>"72157634468645127-72affb2a33ba09b2",
     "oauth_token_secret"=>"9124b779f3b63648",
     "user_nsid"=>"13899279%40N00",
     "username"=>"redeemedfadi"}

    @flickr.access_token = creds["oauth_token"]
    @flickr.access_secret = creds["oauth_token_secret"]

    @login = flickr.test.login

    @my_photo_titles = []
    @my_sets = []
  end


  def getPhotos

    page = 1

    while true do

      photos = @flickr.people.getPhotos user_id: 'me', per_page: 500, page: page

      break if photos.none?

      @my_photo_titles = @my_photo_titles | photos.map{|p| p["title"]}

      puts page += 1
    end
  end

end
