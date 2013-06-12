# coding: utf-8
require 'yaml'
require 'active_support/core_ext/module/attribute_accessors.rb'

require 'locus/version'
require 'locus/railtie' if defined?(Rails)

require 'locus/place'

# Locus.
module Locus
  mattr_accessor :zip_path, :default_country

  self.zip_path =
    File.expand_path(File.join('..', 'data', 'zipcodes.yml'), __FILE__)
  self.default_country = :de
end
