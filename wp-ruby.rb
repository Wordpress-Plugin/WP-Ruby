#!/usr/bin/env ruby
WPR_PATH = File.dirname(__FILE__)

require_relative 'lib/utilities'
require_relative 'lib/generator'
require_relative 'lib/template'

class WPRApplication
  # run the application
  def self.run(params)
    task = params.shift # remove task

    case task
    when "gen"
      type = params.shift # CPT type
      w = WPRGenerator.new
      w.gen(type, params)
    end
  end
end

WPRApplication.run(ARGV)