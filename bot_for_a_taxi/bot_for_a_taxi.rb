# frozen_string_literal: true

require './class_operator.rb'

class TaxiBot
  AVERAGE_SPEED = 60
  RATE = (rand * 10).round(2)

  def initialize(point_a, point_b)
    @point_a = point_a
    @point_b = point_b
  end

  def operator(name = nil, age = nil, sex = nil, avatar_img = nil)
    @_operator ||= create_operator(name, age, sex, avatar_img)
  end

  def distance
    "#{calculate_distance} km"
  end

  def price
    "#{calculate_price} $"
  end

  def waiting_car_time
    "#{calculate_waiting_car_time} minutes"
  end

  def taxi_car
    select_taxi
  end

  private

  def create_operator(name, age, sex, avatar_img)
    Operator.new(name, age, sex, avatar_img)
  end

  def calculate_price
    ((select_taxi[:distance] + calculate_distance) / RATE).round(2)
  end

  def calculate_distance
    (@point_a - @point_b).abs
  end

  def calculate_waiting_car_time
    select_taxi[:distance] / AVERAGE_SPEED * 60
  end

  def distance_from_car_to_point_a
    taxi_base = [{ model: 'Hyundai solaris', color: 'grey', number: 'x161xx161', distance: 15 },
                 { model: 'Lada Kalina', color: 'black', number: 'x162xx162', distance: 25 },
                 { model: 'Lada Granta', color: 'white', number: 'x163xx163', distance: 35 }]

    taxi_base.each { |car| car[:distance] = (car[:distance] - @point_a.to_i).abs }
  end

  def select_taxi
    distance_from_car_to_point_a.min_by { |car| car[:distance] }
  end
end
