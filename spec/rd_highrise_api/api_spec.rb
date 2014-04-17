require 'spec_helper'

class Test; include RdHighriseApi::Api; end

describe RdHighriseApi::Api do
	let(:xml) { "<errors><error>First name can't be blank</error><error>Last name can't be blank</error></errors>"}

	it "should parse error messages correctly" do
		expect(Test.new.error_messages_from(xml)).to eql(["First name can't be blank", "Last name can't be blank"])
	end
end