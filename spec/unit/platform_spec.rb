# coding: utf-8

RSpec.describe TTY::Platform, 'platform' do
  it "correctly detects windows platform" do
    allow(RbConfig::CONFIG).to receive(:[]).with('arch').and_return('x86-mswin32_60')
    platform = TTY::Platform.new
    expect(platform.windows?).to eq(true)
  end

  it "fails to detect windows" do
    allow(RbConfig::CONFIG).to receive(:[]).with('arch').and_return('unknown')
    platform = TTY::Platform.new
    expect(platform.windows?).to eq(false)
  end

  it "correctly detects windows platform at class level" do
    allow(RbConfig::CONFIG).to receive(:[]).with('arch').and_return('x86-mswin32_60')
    expect(TTY::Platform.windows?).to eq(true)
  end

  it "correctly detects linux platform" do
    allow(RbConfig::CONFIG).to receive(:[]).with('arch').and_return('x86_64-linux')
    platform = TTY::Platform.new
    expect(platform.linux?).to eq(true)
  end

  it "fails to detect linux platform" do
    allow(RbConfig::CONFIG).to receive(:[]).with('arch').and_return('unknown')
    platform = TTY::Platform.new
    expect(platform.linux?).to eq(false)
  end

  it "correctly detects linux platform at class level" do
    allow(RbConfig::CONFIG).to receive(:[]).with('arch').and_return('x86_64-linux')
    expect(TTY::Platform.linux?).to eq(true)
  end

  it "correctly detects mac platform" do
    allow(RbConfig::CONFIG).to receive(:[]).with('arch').and_return('x86_64-darwin')
    platform = TTY::Platform.new
    expect(platform.mac?).to eq(true)
  end

  it "fails to detect mac platform" do
    allow(RbConfig::CONFIG).to receive(:[]).with('arch').and_return('unknown')
    platform = TTY::Platform.new
    expect(platform.mac?).to eq(false)
  end

  it "correctly detects mac platform at class level" do
    allow(RbConfig::CONFIG).to receive(:[]).with('arch').and_return('x86_64-darwin')
    expect(TTY::Platform.mac?).to eq(true)
  end

  it "correctly detects unix platform" do
    allow(RbConfig::CONFIG).to receive(:[]).with('arch').and_return('x86_64-darwin')
    platform = TTY::Platform.new
    expect(platform.unix?).to eq(true)
  end

  it "correctly detects unix platform at class level" do
    allow(RbConfig::CONFIG).to receive(:[]).with('arch').and_return('x86_64-darwin')
    expect(TTY::Platform.unix?).to eq(true)
  end
end
