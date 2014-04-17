module RdHighriseApi
  # Methods used for parsing/connecting to highrise
  module Api
    def error_messages_from(body)
      document = Nokogiri::XML(body)
      document.xpath('//error').map(&:content)
    end

    def faraday
      @faraday ||= Faraday.new(url: @url, ssl: { verify: false }) do |builder|
        builder.basic_auth(@api_key, 'x')
        builder.adapter Faraday.default_adapter
      end
    end
  end
end
