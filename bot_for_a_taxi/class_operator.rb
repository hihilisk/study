# frozen_string_literal: true

class Operator
  def initialize(name = nil, age = nil, sex = nil, avatar_img = nil)
    @name = name
    @age = age
    @sex = sex
    @avatar_img = avatar_img
  end

  def name
    @name
  end

  def age
    @age
  end

  def sex
    @sex
  end

  def avatar_img
    @avatar_img
  end
end
