class NameCollisionError < RuntimeError; end

class Robot
  attr_accessor :name

  @@registry

  def initialize(args = {})
    @@registry ||= []
    @name_generator = args[:name_generator]
    @name = @name_generator ? @name_generator.call : NameGenerator.generate_name(@@registry)
    assert!
    @@registry << @name
  end

  private
  def assert!
    raise NameCollisionError, 'There was a problem generating the robot name!' if !name =~ /[[:alpha:]]{2}[[:digit:]]{3}/ || @@registry.include?(name)
  end
end

class NameGenerator
  def self.generate_name(registry)
    "#{generate_char}#{generate_char}#{generate_num}#{generate_num}#{generate_num}"
  end

  def self.generate_char
    ('A'..'Z').to_a.sample
  end

  def self.generate_num
    rand(10)
  end
end

robot = Robot.new
puts "My pet robot's name is #{robot.name}, but we usually call him sporky."

# Errors!
generator = -> { 'AA111' }
Robot.new(name_generator: generator)
Robot.new(name_generator: generator)
