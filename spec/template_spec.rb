require_relative '../wp-ruby'

describe WPRTemplate do
  it "should load a template file" do
    content = WPRTemplate::render('test/basic')
    content.should eq('this is a test')
  end

  it "should load a template file with variables" do
    content = WPRTemplate::render('test/variables', name: 'Devin');
    content.should eq("Hello, Devin")
  end
end