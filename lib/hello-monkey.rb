module TwilioDemo 
  class HelloMonkey < Sinatra::Base

    post '/hellomonkey' do
      content_type :xml
      @name = AddressBook.lookup(params[:From]) || 'Monkey'
      builder :hellomonkey
    end

    post '/hellomonkey_handle_key' do
      content_type :xml
      digits = params[:Digits]
      case digits
      when '1' then call_gorilla
      when '2' then record_howl
      else
        start_over
      end
    end

    post '/hellomonkey_handle_recording' do
      content_type :xml
      @recording_url = params[:RecordingUrl]
      builder :hellomonkey_handle_recording
    end

    def call_gorilla
      builder :hellomonkey_handle_key_call_gorilla
    end

    def record_howl
      builder :hellomonkey_handle_key_record_howl
    end

    def start_over
      status, headers, body = call request.env.merge("PATH_INFO" => '/hellomonkey')
      [status, body]
    end
    
    def self.app
      TwilioDemo::HelloMonkey.new
    end
    
  end
end
