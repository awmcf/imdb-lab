require_relative("../db/sql_runner")

class Casting

  attr_reader :id
  attr_accessor :movie_id, :star_id, :fee

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @movie_id = options['movie_id'].to_i
    @star_id = options['star_id'].to_i
    @fee = options['fee'].to_i
  end

  def stars_in_movie
    sql = "SELECT FROM movies*. WHERE star_id = $1"
    value = [@star_id]
    location = SqlRunner.run(sql, values).first
    return


  end

  def save()
    sql = "INSERT INTO castings
    (
      movie_id,
      star_id,
      fee
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@movie_id, @star_id, @fee]
    visit = SqlRunner.run( sql,values ).first
    @id = visit['id'].to_i
  end

  def update()
    sql = "UPDATE castings SET movie_id = $1, star_id = $2, fee = $3 WHERE id = $4"
    values = [@movie_id, @star_id, @fee, @id]
    SqlRunner.run( sql, values )
  end

  def self.delete_all()
    sql = "DELETE FROM castings"
    SqlRunner.run(sql)
  end

  def Casting.all()
    sql = "SELECT * FROM castings"
    values = []
    castings = SqlRunner.run(sql, values)
    result = castings.map { |casting| Casting.new( casting ) }
    return result
  end

end
