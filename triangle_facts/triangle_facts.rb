# Killer facts about triangles AWW YEAH
class Triangle
  attr_accessor :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def equilateral?
    side1 == side2 && side2 == side3
  end

  def isosceles?
    [side1, side2, side3].uniq.length == 2
  end

  def scalene?
    !(equilateral || isosceles)
  end

  def recite_facts
    puts recite_type
    puts recite_angles
  end

  def calculate_angles(a, b, c)
    angles = [radians_to_degrees(Math.acos((b**2 + c**2 - a**2) / (2.0 * b * c))),
              radians_to_degrees(Math.acos((a**2 + c**2 - b**2) / (2.0 * a * c))),
              radians_to_degrees(Math.acos((a**2 + b**2 - c**2) / (2.0 * a * b))),
             ]

    angles
  end

  def radians_to_degrees(rads)
    (rads * 180 / Math::PI).round
  end

  private

  def recite_type
    if equilateral
      "This triangle is equilateral!"
    elsif isosceles
      "This triangle is isosceles! Also, that word is hard to type."
    elsif scalene
      "This triangle is scalene and mathematically boring."
    end
  end

  def recite_angles
    angles = calculate_angles(side1, side2, side3)
    "The angles of this triangle are  #{angles.join(',')}"

    puts recite_right_angle(angles)
  end

  def recite_right_angle(angles)
    if angles.include?(90)
      "This triangle is also a right triangle!" 
    end
  end
end

triangles = [
  [5, 5, 5],
  [5, 12, 13],
  [6, 6, 3],
]
triangles.each do |sides|
  tri = Triangle.new(*sides)
  tri.recite_facts
end
