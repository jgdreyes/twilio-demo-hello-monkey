xml.instruct!
xml.Response do
  xml.Say "Record your monkey howl after the tone."
  xml.Record :maxLength => 30, :action => "hellomonkey_handle_recording"
end
