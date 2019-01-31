require_relative( 'models/casting' )
require_relative( 'models/movie' )
require_relative( 'models/star' )

require( 'pry-byebug' )

Casting.delete_all()
Movie.delete_all()
Star.delete_all()

movie_1 = Movie.new({ 'title' => 'Bumblebee', 'genre' => 'Action'})
movie_1.save()

movie_2 = Movie.new({ 'title' => 'Unbreakable', 'genre' => 'Sci-fi'})
movie_2.save()

star_1 = Star.new({ 'first_name' => 'John', 'last_name' => 'Travolta'})
star_1.save()

star_2 = Star.new({ 'first_name' => 'Bruce', 'last_name' => 'Willis'})
star_2.save()

casting_1 = Casting.new({ 'movie_id' => movie_1.id, 'star_id' => star_1.id, 'fee' => 200})
casting_1.save()

casting_2 = Casting.new({ 'movie_id' => movie_2.id, 'star_id' => star_2.id, 'fee' => 100})
casting_2.save()
#
# movie_1 = Movie.new({ 'title' => 'Bumblebee 2', 'genre' => 'Superhero Action'})
# movie_1.update()
#
# star_1 = Star.new({ 'first_name' => 'Johnny', 'last_name' => 'Travvy'})
# star_1.update()

casting_1.fee = 300
casting_1.update
# Movie.all()
# Star.all()
# Casting.all()

binding.pry
nil
