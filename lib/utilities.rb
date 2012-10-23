class WPRUtilities
  def self.copy_to_clipboard(str)
    IO.popen('pbcopy', 'w') { |f| f << str }
    str
  end

  def self.get_from_clipboard
    `pbpaste`
  end
end