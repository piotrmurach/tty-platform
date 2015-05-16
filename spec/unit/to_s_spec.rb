# coding: utf-8

RSpec.describe TTY::Platform, '.to_s' do
  it "display platform information" do
    allow(RbConfig::CONFIG).to receive(:[]).with('arch').and_return('i686-darwin8.10.1')
    platform = TTY::Platform.new
    expect(platform.to_s).to eq('i686-darwin-8.10.1')
  end
end
