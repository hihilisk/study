class CarsRepository
  def initialize
    @loaded_file = IO.readlines('./cars.txt', chomp: true)
  end

  def get_cars
    create_car_array
  end

  private

  def create_car_array
    cars_array = []
    @loaded_file.each { |i| cars_array.push(i.split(';')) }
    cars_array
  end
end
