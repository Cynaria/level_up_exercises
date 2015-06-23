class Arrowhead
  # This seriously belongs in a database.
  CLASSIFICATIONS = {
    far_west: {
      notched: "Archaic Side Notch",
      stemmed: "Archaic Stemmed",
      lanceolate: "Agate Basin",
      bifurcated: "Cody",
    },
    northern_plains: {
      notched: "Besant",
      stemmed: "Archaic Stemmed",
      lanceolate: "Humboldt Constricted Base",
      bifurcated: "Oxbow",
    },
  }

  # FIXME: I don't have time to deal with this.
  def self.classify(region, shape)
    shapes = CLASSIFICATIONS[region]

    if !CLASSIFICATIONS.include?(region)
      raise UnknownRegionError, "Unknown region, please provide a valid region."
    end

    if !shapes.include?(shape)
      raise UnknownShapeError, "Unknown shape value. Are you sure you know what you're talking about?"
    end
    
    arrowhead = shapes[shape]
    "You have a(n) '#{arrowhead}' arrowhead. Probably priceless."
  end
end

class UnknownShapeError < StandardError; end
class UnknownRegionError < StandardError; end

puts Arrowhead.classify(:northern_plains, :bifurcated)
puts Arrowhead.classify(:ponies, :bifurcated)
