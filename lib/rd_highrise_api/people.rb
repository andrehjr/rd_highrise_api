require 'nokogiri'
require 'faraday'

module RdHighriseApi
  # Reflects the People Api endpoint on Highrise
  class People
    def initialize(url, api_key)
      @url = url
      @api_key = api_key
    end

    def all
      response = faraday.get('/people.xml')
      fail ConnectionError if response.status != 200

      document = Nokogiri.XML(response.body)
      document.xpath('//person').map do |doc|
        as_hash(doc)
      end
    end

    def create(params)
      faraday.post('/people.xml')
    end

    private

    def faraday
      @faraday ||= Faraday.new(url: @url, ssl: { verify: false }) do |builder|
        builder.basic_auth(@api_key, 'x')
        builder.adapter Faraday.default_adapter
      end
    end

    def as_hash(document)
      {
        first_name: document.at_xpath('//first-name').content,
        last_name: document.at_xpath('//last-name').content,
        title: document.at_xpath('//title').content,
        background: document.at_xpath('//background').content,
        linkedin_url: document.at_xpath('//linkedin-url').content
      }
    end
  end
end
