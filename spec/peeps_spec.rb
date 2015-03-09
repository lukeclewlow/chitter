require 'spec_helper'

describe Peeps do
	
	context "checking DataMapper is working" do

    it 'should be created and then retrieved from the db' do
      expect(Peeps.count).to eq(0)
      Peeps.create(text: 'blah blah blah blah blah')
      expect(Peeps.count).to eq(1)
      peeps = Peeps.first
      expect(peeps.text).to eq('blah blah blah blah blah')
      peeps.destroy
      expect(Peeps.count).to eq(0)
    end

	end

end