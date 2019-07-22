class TaxiBot
  AVERAGE_SPEED = 60
  RATE = (rand * 10).round(2)

  def initialize(point_a, point_b)
    @point_a = point_a
    @point_b = point_b
  end

  def operator
    @operator = Operator.new
    @operator.requesting_data
  end

  def distance
    (@point_a - @point_b).abs
  end

  def price
    "#{((select_car[:distance] + distance) / RATE).round(2)} $"
  end

  def waiting_car_time
    "#{select_car[:distance] / AVERAGE_SPEED * 60} minutes"
  end

  private

  def select_car
    taxi_car_location = [{ model: 'Hyundai solaris', color: 'grey', number: 'x161xx161', distance: 15 },
                         { model: 'Lada Kalina', color: 'black', number: 'x162xx162', distance: 25 },
                         { model: 'Lada Granta', color: 'white', number: 'x163xx163', distance: 35 }]

    @taxi_car = taxi_car_location.each { |car| car[:distance] = (car[:distance] - @point_a.to_i).abs }
    @taxi_car = @taxi_car.min_by { |car| car[:distance] }
  end
end

class Operator
  def initialize(name = 'Alisa', age = 23, sex = 'female', avatar_img = './random_img')
    @name, @age, @sex, @avatar_img = name, age, sex, avatar_img
  end

  def requesting_data
    @name; @age; @sex; @avatar_img
  end
end
