# frozen_string_literal: true

class RoadCongestion
  def initialize(*array)
    @array_car_position = array
  end

  def show_road_load_in_points
    "road congestion: #{calculate_road_congestion_in_points}"
  end

  private

  def calculate_distance_between_car
    distance_between_car = []

    @array_car_position.each_index do |i|
      i < @array_car_position.size - 1 ? distance_between_car.push((@array_car_position[i] - @array_car_position[i + 1]).abs) : break
    end

    distance_between_car
  end

  def calculate_average_distance_between_car
    acc = 0.0001 # incorrect behavior occurs at zero
    calculate_distance_between_car.each { |i| acc += i }
    acc / calculate_distance_between_car.size
  end

  def calculate_road_congestion_in_points
    road_congestion = 10 - calculate_average_distance_between_car / 10
    road_congestion < 0 ? 0 : road_congestion.round(1)
  end
end
