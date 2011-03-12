xml.instruct!
xml.Response do
  xml.Dial AddressBook.name_lookup('Gorilla')
  xml.Say "What's the twilio? The call failed or the remote party hung up.  Goodbye."
end
