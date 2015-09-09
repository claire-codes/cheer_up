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

    expect(STDOUT).to receive(:puts).with('Eat my shorts bob')
    CheerUp::Cli.new.hello "bob"
  end

  it 'prints stuff out to the command line' do
    expect(STDOUT).to receive(:puts).with('Howdy ho bob')
    CheerUp::Cli.new.hello "bob"
  end

  it 'can handle running without a name provided (no args)' do
    expect(STDOUT).to receive(:puts).with('Howdy ho')
    CheerUp::Cli.new.hello
  end

  it 'can handle names with spaces as long as they\'re quoted' do
    expect(STDOUT).to receive(:puts).with('Howdy ho mary ann')
    CheerUp::Cli.new.hello "mary ann"
  end

  it 'can\'t handle more than one arg' do
    expect {
      CheerUp::Cli.new.hello "mary", "ann"
    }.to raise_error(ArgumentError)
    
    
  end

end
