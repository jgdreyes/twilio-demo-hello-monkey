require File.dirname(__FILE__) + '/config/boot.rb'

run TwilioDemo::HelloMonkey

#run Rack::URLMap.new({
#            "/hellomonkey" => TwilioDemo::HelloMonkey.new
#})
