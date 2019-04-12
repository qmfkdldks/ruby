require 'rubygems'
require 'bundler/setup'
require 'treetop'

module Emoji
class IntegerLiteral < Treetop::Runtime::SyntaxNode
end

class StringLiteral < Treetop::Runtime::SyntaxNode
end

class Expression < Treetop::Runtime::SyntaxNode
end
end
