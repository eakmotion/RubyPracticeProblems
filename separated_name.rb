# Return a string formatted as a list of names separated by commas except
# for the last two names, which should be separated by an ampersand.

require 'spec_helper'

def list names
  # Shortest version
  # names.map(&:values).join(', ').gsub(/, (\w+)$/, " & \\1")

  names = names.map{ |name| name[:name] }
  last_name = names.pop
  return last_name.to_s if names.empty?
  "#{names.join(', ')} & #{last_name}"
end

describe 'list' do
  it 'Example cases' do
    expect(list([{name: 'Bart'},{name: 'Lisa'},{name: 'Maggie'},{name: 'Homer'},{name: 'Marge'}]))
      .to eq('Bart, Lisa, Maggie, Homer & Marge')
    expect(list([{name: 'Bart'},{name: 'Lisa'}]))
      .to eq('Bart & Lisa')
    expect(list([{name: 'Bart'},{name: 'Lisa'},{name: 'Maggie'},{name: 'Homer'},{name: 'Marge'}]))
      .to eq('Bart, Lisa, Maggie, Homer & Marge')
    expect(list([{name: 'Bart'}]))
      .to eq('Bart')
    expect(list([]))
      .to eq('')
  end
end
