require 'locus'
require 'rails'

module Locus
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'locus/tasks/geonames.rake'
    end
  end
end
