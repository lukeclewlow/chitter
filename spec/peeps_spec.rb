require 'spec_helper'

describe Peeps do
	
	context "checking DataMapper is working" do

	# This is not a real test, it's simply a demo of how it works
    it 'should be created and then retrieved from the db' do
      # In the beginning our database is empty, so there are no links
      expect(Peeps.count).to eq(0)
      # this creates it in the database, so it's stored on the disk
      Peeps.create(text: 'blah blah blah blah blah')
      # We ask the database how many links we have, it should be 1
      expect(Peeps.count).to eq(1)
      # Let's get the first (and only) link from the database
      peeps = Peeps.first
      # Now it has all properties that it was saved with.
      expect(peeps.text).to eq('blah blah blah blah blah')
      # If we want to, we can destroy it
      peeps.destroy
      # so now we have no links in the database
      expect(Peeps.count).to eq(0)
    end

	end

end