# frozen_string_literal: true

class RoadLoadChecker
  def initialize(points)
    @array_car_position = points
  end

  def show_road_load_in_points
    calculate_road_congestion_in_points
  end

  private

  def calculate_distance_between_cars
    distance_between_cars = []

    @array_car_position.each do |i|
      break if i > @array_car_position.size - 1

      distance_between_two_cars = (@array_car_position[i] - @array_car_position[i + 1]).abs
      distance_between_cars.push(distance_between_two_cars)
    end

    distance_between_cars
  end

  def calculate_average_distance_between_cars
    acc = 0.0
    calculate_distance_between_cars.each { |i| acc += i }
    acc / calculate_distance_between_cars.size
  end

  def calculate_road_congestion_in_points
    road_congestion = 10 - calculate_average_distance_between_cars / 10
    road_congestion < 0 ? 0 : road_congestion.round(1)
  end
end
