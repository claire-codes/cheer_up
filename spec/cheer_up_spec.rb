require 'spec_helper'

describe CheerUp do
	subject { CheerUp }

  it 'has a version number' do
    expect(CheerUp::VERSION).not_to be nil
  end

  xit 'does run the method' do
    expect(CheerUp.cheer_up 'foo').to eq 42
  end

  it 'prints what it just said to stout' do
  	expect(STDOUT).to receive(:puts).with('cheer up foo')
  	# expect(subject).to receive(:cheer_up).with('foo')
  	CheerUp.cheer_up 'foo'
  	# expect(`print "cheer up foo"`).to output("cheer up foo").to_stdout
  end

  it 'runs without a name' do

  end

  it 'won\'t run with more than one arg' do

  end

  it 'will say a multi-word name if it\`s quoted' do

  end
  
end
