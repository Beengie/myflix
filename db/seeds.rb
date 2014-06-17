# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

comedies = Category.create(category: "Comedy")
dramas = Category.create(category: "Drama")

Video.create(title: 'Star Wars', description: 'A classic about fighting in space', small_cover_url: '/tmp/family_guy.jpg', large_cover_url: '/tmp/monk_large.jpg', category: comedies)
Video.create(title: 'Star Trek', description: 'A wanna be classic about space', small_cover_url: '/tmp/futurama.jpg', large_cover_url: '/tmp/monk_large.jpg', category: comedies)
Video.create(title: 'Rush', description: 'A thriller about F-1 racing', small_cover_url: '/tmp/monk.jpg', large_cover_url: '/tmp/monk_large.jpg', category: comedies)
Video.create(title: 'Casper', description: 'A classic ghost story', small_cover_url: '/tmp/south_park.jpg', large_cover_url: '/tmp/monk_large.jpg', category: comedies)
Video.create(title: 'Gravity', description: 'A film about the future', small_cover_url: '/tmp/family_guy.jpg', large_cover_url: '/tmp/monk_large.jpg', category: comedies)
Video.create(title: 'South_Park', description: 'A classic about fighting in space', small_cover_url: '/tmp/family_guy.jpg', large_cover_url: '/tmp/monk_large.jpg', category: comedies)
Video.create(title: 'Futurama', description: 'A wanna be classic about space', small_cover_url: '/tmp/futurama.jpg', large_cover_url: '/tmp/monk_large.jpg', category: comedies)
monk = Video.create(title: 'Monk', description: 'A thriller about F-1 racing', small_cover_url: '/tmp/monk.jpg', large_cover_url: '/tmp/monk_large.jpg', category: dramas)
Video.create(title: 'Family Guy', description: 'A classic ghost story', small_cover_url: '/tmp/south_park.jpg', large_cover_url: '/tmp/monk_large.jpg', category: dramas)
Video.create(title: 'Hitman', description: 'A film about the future', small_cover_url: '/tmp/family_guy.jpg', large_cover_url: '/tmp/monk_large.jpg', category: dramas)

tim = User.create(username: "Tim Watson", password: "password", email: "tim@example.com")

Review.create(user: tim, video: monk, rating: 3, content: "This is a very lame movie!")
Review.create(user: tim, video: monk, rating: 1, content: "This is a very very lame movie!")