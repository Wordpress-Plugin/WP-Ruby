require 'active_support/inflector'
require 'lorem'

class WPRGenerator
  def gen(type, params)
    case type
    when "cpt"
      code = self.cpt(params[0], params[1])
    when "lorem"
      code = self.lorem(params[0], params[1])
    else
      raise 'You must specify a type to generate'
    end

    WPRUtilities::copy_to_clipboard(code)
    puts "The code is in your clipboard!"
  end

  # generate code for a CPT
  def cpt(name, plural = nil)
    plural = name.pluralize if plural.nil?
    
    WPRTemplate::render('cpt', { name: name, plural: plural })
  end

  # generate lorem ipsum
  def lorem(number = nil, type = nil)
    number = 1 if number.nil?
    type = 'paragraphs' if type.nil?
    Lorem::Base.new(type, number).output
  end
end