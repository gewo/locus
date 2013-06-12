# coding: utf-8
require 'yaml'

namespace :locus do
  namespace :import do

    unless Rake::Task.task_defined?('locus:import:zip')
      desc 'import geonames zip code db and convert it to yaml'
      task :zip, :output, :input do |task, args|
        input_files = args.input.split(' ')

        result = input_files.map do |file|
          country = nil
          codes = IO.readlines(file).map do |line|
            line = line.split("\t")
            country ||= line[0].downcase.to_sym
            { line[1] => line[4] }
          end.reduce(:merge)
          { country => codes }
        end.reduce(:merge)

        IO.write(args.output, result.to_yaml)
      end
    end
  end
end
