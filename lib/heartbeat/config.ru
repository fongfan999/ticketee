# This file is used by Rack-based servers to start the application on 9292 port

require ::File.expand_path('../application', __FILE__)
require ::File.expand_path('../test_application', __FILE__)

app = Rack::Builder.app do
  map "/test" do
    run Heartbeat::Application
  end

  map "/" do
    run Heartbeat::TestApplication
  end
end
run app