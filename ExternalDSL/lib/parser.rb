require 'rubygems'
require 'bundler/setup'

$base_path = File.expand_path(File.dirname(__FILE__))

require File.join($base_path, 'emoji_extensions.rb')

class Parser
	Treetop.load(File.join($base_path, 'emoji_parser.treetop'))
	@@parser = EmojiParser.new

	def self.parse(data)
	# delegate parse to Treetop parser
	tree =	@@parser.parse data
	if tree.nil?
		raise RuntimeError, "Parse error at offset: #{@@parser.index} \n #{@@parser.failure_reason}"
	end

	self.clean_tree tree
	puts tree
	return tree
	end

	private
	def self.clean_tree root_node
	return if root_node.elements
	root_node.elements.delete_if{|node| node.class.name == "Treetop::Runtime::SyntaxNode"}
	root_node.elements.each {|node| self.clean_tree node}
	end
end
