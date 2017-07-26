# idea model
require 'json'
require 'pry'

class Idea
  attr_accessor :name, :childs

  def initialize(name, childs = [])
    raise ArgumentError.new("Invalid Idea Name") unless name.instance_of?(String)

    @name = name
    @childs = childs
  end
end
