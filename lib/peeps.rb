class Peeps

	include DataMapper::Resource

	property :id, Serial
	property :text, Text, :length => 1..140

	# belongs_to :user

end