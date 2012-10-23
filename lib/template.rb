require 'erubis'

class WPRTemplate
  def self.render(template, params = {})
    parsed = File.read(WPR_PATH + "/templates/#{template}.eruby")
    Erubis::Eruby.new(parsed).result(params)
  end
end