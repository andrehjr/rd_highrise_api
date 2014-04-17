require 'spec_helper'

describe RdHighriseApi::People do
  let(:api) { RdHighriseApi::People.new('https://andrehjr.highrisehq.com', '028bcc7b7986b72d4c9542dbbb1a85') }

  it "should fetch people from highrise" do
    VCR.use_cassette('list') do
      people = api.all
      expect(people).to be_a(Array)
    end
  end

  it "should parse person xml data from highrise correctly" do
    VCR.use_cassette('list') do
      person = api.all.first
      expect(person.keys).to include(:first_name, :last_name)
      expect(person[:first_name]).to eql("André L.")
    end
  end

  it "should generate a person xml from parameters" do
    VCR.use_cassette('create') do
      api.create(first_name: "Luke", last_name: 'Skywalker', title: 'Test title', background: 'A background')
    end
  end
end