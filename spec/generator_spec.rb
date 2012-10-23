require_relative '../wp-ruby'

describe WPRGenerator do
  it "should require a type" do
    expect { WPGenerator.new.gen(nil, []) }.to raise_error
  end

  it "should put CPT code in clipboard" do
    WPRGenerator.new.gen('cpt', ['test', 'tests'])
    clipboard_contents = WPRUtilities::get_from_clipboard

    params = { name: 'test', plural: 'tests' }
    content = WPRTemplate::render('cpt', params)
    clipboard_contents.should eq(content)
  end

  it "should generate Lorem Ipsum" do
    WPRGenerator.new.gen('lorem', [2, 'words'])
    clipboard_contents = WPRUtilities::get_from_clipboard
    clipboard_contents.downcase.should eq('lorem ipsum')
  end
end