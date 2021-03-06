# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(username: "Deirdreisawesome")
user2 = User.create(username: "AwesomeChris")
artwork1 = Artwork.create(title: "Awesome Possums", image_url: ".com", artist_id: user1.id)
artwork2 = Artwork.create(title: "Awesome Blossums", image_url: ".net", artist_id: user2.id)
share1 = ArtworkShare.create(artwork_id: user1.id, viewer_id: user2.id)
share2 = ArtworkShare.create(artwork_id: user2.id, viewer_id: user1.id)
