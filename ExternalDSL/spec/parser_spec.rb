require 'parser'

RSpec.describe Parser, "#parse" do
it "parse given string" do
	puts Parser.parse '1+1'
	# Parser.parse '😣'
end
end
