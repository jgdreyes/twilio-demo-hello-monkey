xml.instruct!
xml.Response do 
  xml.Say "Hello #{@name}"
  xml.Play "http://demo.twilio.com/hellomonkey/monkey.mp3"
  xml.Gather :numDigits => 1, :action => 'hellomonkey_handle_key', :method => 'POST' do
    xml.Say "To speak to a real monkey, press 1.  To record your own howl, press 2.  Press any other key to start over."
  end
end
