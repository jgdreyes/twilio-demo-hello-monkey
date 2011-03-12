module AddressBook
  ENTRIES = {
    '+13105551212' => 'Gorilla'
  }.freeze

  def self.lookup(phone_number)
    ENTRIES[phone_number]
  end

  def self.name_lookup(name)
    entry = ENTRIES.detect {|k, v| v == name }
    entry.first if entry
  end
end
