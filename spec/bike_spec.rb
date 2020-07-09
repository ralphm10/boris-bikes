require 'bike'

describe Bike do
  it 'responds to working?' do
    expect(subject).to respond_to :working?
  end
  it 'responds to method report' do
    expect(subject).to respond_to :report_broken
  end
  it 'initializes a working bike' do
    expect(subject.broken).to eq false
  end
  it 'changes state to broken when method report_broken is called' do
    expect(subject.report_broken).to eq true
  end
end
