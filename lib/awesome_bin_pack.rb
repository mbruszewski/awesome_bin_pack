require "awesome_bin_pack/version"

require 'awesome_bin_pack/bin'
require 'awesome_bin_pack/rectangle'
require 'awesome_bin_pack/rectangle_algorithms'

module AwesomeBinPack
  class Error < StandardError; end
  
  def self.yell
    "IM YELLING!!!"
  end
end
