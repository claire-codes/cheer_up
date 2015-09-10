require 'spec_helper'

describe CheerUp do

  before(:each) do
    allow_any_instance_of(Array).to receive(:sample).and_return("Howdy ho")
  end

  it 'has a version number' do
    expect(CheerUp::VERSION).not_to be nil
  end

  it "stubbing array::sample works" do
    allow_any_instance_of(Array).to receive(:sample).and_return("Eat my shorts")

    cheerObj = CheerUp::Cli.new

    expect(STDOUT).to receive(:puts).with('Eat my shorts bob')
    expect(cheerObj).to receive(:system).with('say Eat my shorts bob')
    cheerObj.cheer_up "bob"
  end

  it 'prints stuff out to the command line' do
    expect(STDOUT).to receive(:puts).with('Howdy ho bob')
    CheerUp::Cli.new.cheer_up "bob"
  end

  it 'can handle running without a name provided (no args)' do
    expect(STDOUT).to receive(:puts).with('Howdy ho')
    CheerUp::Cli.new.cheer_up
  end

  it 'can handle names with spaces as long as they\'re quoted' do
    expect(STDOUT).to receive(:puts).with('Howdy ho gordon parker dennis')
    CheerUp::Cli.new.cheer_up "gordon parker dennis"
  end

  it 'can\'t handle more than one arg' do
    expect {
      CheerUp::Cli.new.cheer_up "mary", "ann"
    }.to raise_error(ArgumentError)
  end

  # test passes and works irl but this test still says it?! :S
  it 'still prints if you\'re not on osx' do
    cheerObj = CheerUp::Cli.new
    cheerObj.stub(:osx?) { false }
    expect(STDOUT).to receive(:puts).with('Howdy ho brenda')

    expect(cheerObj).to receive(:system).with('say Howdy ho brenda')
    CheerUp::Cli.new.cheer_up "brenda"
  end

end
