class Peeps

	include DataMapper::Resource

	property :id, Serial
	property :text, String

end