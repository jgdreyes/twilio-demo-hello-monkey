require 'spec_helper'

describe TwilioDemo::HelloMonkey do
  
  def app
    @app ||= TwilioDemo::HelloMonkey.app
  end
  
  describe "POST '/hellomonkey'" do
    before do
      @phone_number = '+14151234567'
    end

    it "should be successful" do
      post '/hellomonkey'
      last_response.should be_ok
    end

    it "should say hello to caller" do
      AddressBook.should_receive(:lookup).with(@phone_number).and_return('Jennifer')
      post '/hellomonkey', :From => @phone_number
      last_response.body.should match /Jennifer/
    end

    it "should say hello to monkey" do
      AddressBook.should_receive(:lookup).with(@phone_number).and_return(nil)
      post '/hellomonkey', :From => @phone_number
      last_response.body.should match /Monkey/
    end

    it "should play a song" do
      post '/hellomonkey', :From => @phone_number 
      last_response.body.should have_selector('play')
    end
    
    it "should wait for user key input" do
      post '/hellomonkey', :From => @phone_number 
      last_response.body.should have_selector('gather say')
    end
  end

  describe "POST '/hellomonkey_handle_key'" do
    it "should dial gorilla if user presses 1" do
      post '/hellomonkey_handle_key', :Digits => '1'
      last_response.body.should have_selector('dial', :content => AddressBook.name_lookup('Gorilla'))
    end

    it "should allow user to record monkey howl if user presses 2" do
      post '/hellomonkey_handle_key', :Digits => '2'
      last_response.body.should have_selector('record')
    end

    it "should send user back to initial greeting" do
      post '/hellomonkey_handle_key', :Digits => '3'
      last_response.body.should_not have_selector('dial', :content => AddressBook.name_lookup('Gorilla'))
    end
  end

  describe "POST '/hellomonkey_handle_recording'" do
    it "should be successful" do
      post '/hellomonkey_handle_recording'
      last_response.should be_ok
    end

    it "should play a recording" do
      recording_url = 'RECORDING_URL'
      post '/hellomonkey_handle_recording', :RecordingUrl => recording_url
      last_response.body.should have_selector('play', :content => recording_url)
    end
  end
end
