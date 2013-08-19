require 'flickraw'

FlickRaw.api_key = 'API_KEY'
FlickRaw.shared_secret = 'SECRET'

creds = {"fullname"=>nil,
 "oauth_token"=>"TOKEN",
 "oauth_token_secret"=>"SECRET",
 "user_nsid"=>"13899279%40N00",
 "username"=>"redeemedfadi"}

flickr.access_token = creds["oauth_token"]
flickr.access_secret = creds["oauth_token_secret"]

login = flickr.test.login

my_photo_titles = []
my_sets = []
page = 1

while true do
  photos = flickr.people.getPhotos user_id: 'me', per_page: 500, page: page

  break if photos.none?

  my_photo_titles = my_photo_titles | photos.map{|p| p["title"]}

  puts page += 1
end
