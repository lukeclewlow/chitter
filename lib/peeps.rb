require 'dm-core'

class Peeps

	include DataMapper::Resource

	property :id, Serial
	property :text, Text, :length => 1..140
	property :created_at, DateTime

	# belongs_to :user

end