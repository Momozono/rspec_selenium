require 'capybara/rspec'
require 'selenium-webdriver'


RSpec.configure do |config|
	config.include Capybara::DSL
end

Capybara.configure do |config|
	config.run_server = false
	config.default_driver = :selenium
	config.app_host = 'https://twitter.com/'
end

Capybara.register_driver :selenium do |app|
	Capybara::Selenium::Driver.new(app, :browser => :chrome)
end




describe "Twitter home" do
	before do 
		visit '/'
	end

	subject { page }

	describe "visit root page" do
		it { should have_title('Twitterへようこそ') }
	end
end