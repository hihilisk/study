class TaxiBot
  attr_reader :distance
  AVERAGE_SPEED = 60
  RATE = (rand * 10).round(2)

  def initialize(point_a, point_b)
    @point_a = point_a
    @point_b = point_b
    @distance = "#{(@point_a - @point_b).abs} km"
  end

  def price
    @coast = "#{((select_car[:distance] + @distance.to_i) / RATE).round(2)} $"
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
