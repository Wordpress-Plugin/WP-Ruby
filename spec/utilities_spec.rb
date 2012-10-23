require_relative '../wp-ruby'

describe WPRUtilities do
  it "should copy text to the clipboard" do
    WPRUtilities::copy_to_clipboard('test')
    content = WPRUtilities::get_from_clipboard
    content.should eq('test')
  end
end