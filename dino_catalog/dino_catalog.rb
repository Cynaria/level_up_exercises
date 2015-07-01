class DinoDex
	attr_accessor :collection

	def initialize(dinos)
		@collection = dinos
	end

	# def self.export(type)
		
	# end
end

class Dinosaur
	attr_reader :name, :period, :continent, :diet, :weight, :walking, :description
	def initialize(args = {})
		@name        = args[:name]
		@period      = args[:period]
		@continent   = args[:continent]
		@diet        = args[:diet]
		@weight      = args[:weight]
		@walking     = args[:walking]
		@description = args[:description]
	end

	def biped?
		@walking == "Biped" ? true : false
	end

	def carnivore?
		%w(Carnivore Insectivore Piscivore).include?(diet)
	end

	def Period?(in_period)
		period.include?(in_period)
	end

	def big?
		@weight > 2_000
	end
end

class CSVParser
	attr_reader :file_name
	def initialize(file_name)
		@file_name = file_name
	end

	def create_dinos
		collection = []
		CSV.foreach(file_name, headers: true, header_converters: :symbol) do |row|
			collection << Dinosaur.new(standardize_dino(row))
		end
		collection
	end

	private

	def standardize_dino(dino_attrs)
		{
			name:       dino_attrs[:name] || dino_attrs[:genus],
			period:     dino_attrs[:period],
			continent:  dino_attrs[:continent] || "Africa",
			diet:       dino_attrs[:diet] || convert_diet(dino_attrs[:carnivore]),
			weight:     (dino_attrs[:weight_in_lbs] || dino_attrs[:weight]).to_i,
			walking:    dino_attrs[:walking],
			description:dino_attrs[:description] || "N/A"
		}
	end

	def convert_diet(carnivore)
		if carnivore == "Yes"
			"Carnivore"
		else
			"Herbavore"
		end
	end
end

class Exporter
	def export
		raise NotImplimentedError		
	end
end

class Json < Exporter
	def export(item)
		File.new()
	end
end

require "csv"

parser = CSVParser.new("dinodex.csv")
dinodex = DinoDex.new(parser.create_dinos)
puts dinodex.bipeds.period("Cretaceous")