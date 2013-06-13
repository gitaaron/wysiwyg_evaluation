require 'capybara/cucumber'

#capybara will not run a local server
Capybara.run_server = false

#Capybara.javascript_driver = :webkit

#browser to be used in the test
browser = ENV['BROWSER'] || 'chrome'
@browserid = browser

#location of selenium server
selenium_server = ENV['SELENIUM_SERVER']

Capybara.app_host = 'http://localhost:3000'

#if no server location is specified, location will default to local
#browser defaults to firefox so browser field may be left empty
if (selenium_server.nil?)
  Capybara.default_driver = :selenium
  Capybara.register_driver :selenium do |app|
    @driver = Capybara::Selenium::Driver.new(app, :browser => browser.to_sym)
  end
#if all fields are specified, test will run based on given parameters
else
  Capybara.default_driver = :selenium
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app,
      :browser => :remote,
      :url =>selenium_server,
      :desired_capabilities => browser.to_sym)
  end
end

class CustomWorld

  @editor = nil
  @browser = @browserid
  def setupEditor(editor)
      case editor
        when "bootstrap-wysihtml5"
          @editor = Wysihtml5Editor.new
        when "tinymce"
          @editor = TinyMCE.new
      end
  end

end

World do
  CustomWorld.new

end




