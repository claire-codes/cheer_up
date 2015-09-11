require 'spec_helper'

describe CheerUp do
  let(:cheerObj) { CheerUp::Cli.new }
  before(:each) do
    allow_any_instance_of(Array).to receive(:sample).and_return('Howdy ho')
  end

  it 'has a version number' do
    # Keeping this one in as it's my sanity check that the tests are working!
    expect(CheerUp::VERSION).not_to be nil
  end

  it 'double checks that stubbing Array::sample works' do
    allow_any_instance_of(Array).to receive(:sample).and_return('Eat my shorts')

    expect(STDOUT).to receive(:puts).with('Eat my shorts bob')
    expect(cheerObj).to receive(:system).with('say "Eat my shorts bob"')
    cheerObj.cheer_up 'bob'
  end

  it 'executes "say" and prints to command line happy path' do
    expect(STDOUT).to receive(:puts).with('Howdy ho bob')
    expect(cheerObj).to receive(:system).with('say "Howdy ho bob"')
    cheerObj.cheer_up 'bob'
  end

  it 'can handle running without a name argument' do
    expect(STDOUT).to receive(:puts).with('Howdy ho')
    expect(cheerObj).to receive(:system).with('say "Howdy ho"')
    cheerObj.cheer_up
  end

  it 'can handle names with spaces as long as they\'re quoted' do
    expect(STDOUT).to receive(:puts).with('Howdy ho amy parker dennis')
    expect(cheerObj).to receive(:system).with('say "Howdy ho amy parker dennis"')
    cheerObj.cheer_up 'amy parker dennis'
  end

  it 'can\'t handle more than one arg' do
    expect { cheerObj.cheer_up 'mary', 'ann' }.to raise_error(ArgumentError)
  end

  it 'still prints if you\'re not on osx but doesn\'t say anything' do
    allow(cheerObj). to receive(:osx?).and_return(false)
    expect(STDOUT).to receive(:puts).with('Howdy ho brenda')

    expect(cheerObj).not_to receive(:system).with('say Howdy ho brenda')
    cheerObj.cheer_up 'brenda'
  end

  xit 'capitalises arguments as names' do

  end
end
