# coding: utf-8

RSpec.describe TTY::Platform, '#new' do
  it "detects system properties" do
    allow(RbConfig::CONFIG).to receive(:[]).with('arch').and_return('i686-darwin8.10.1')
    platform = TTY::Platform.new
    expect(platform.cpu).to eq('i686')
    expect(platform.os).to eq('darwin')
    expect(platform.version).to eq('8.10.1')
  end

  {
    # aix
    'powerpc-aix7.1'      => ['powerpc',    'aix',       '7.1'],
    # bitrig
    'amd64-bitrig1.0'     => ['amd64',      'bitrig',    '1.0'],
    'armv7-bitrig1.0'     => ['armv7',      'bitrig',    '1.0'],
    'bitrig1.0'           => [nil,          'bitrig',    '1.0'],
    # cygwin
    'i386-cygwin'         => ['i386',       'cygwin',     nil],
    # darwin
    'powerpc-darwin7'     => ['powerpc',    'darwin',    '7'],
    'universal-darwin9'   => ['universal',  'darwin',    '9'],
    'x86_64-darwin14.0.0' => ['x86_64',     'darwin',    '14.0.0'],
    'x86_64-darwin'       => ['x86_64',     'darwin',     nil],
    # freebsd
    'amd64-freebsd10.1'   => ['amd64',      'freebsd',   '10.1'],
    'i386-freebsd10.1'    => ['i386',       'freebsd',   '10.1'],
    'i386-freebsd10'      => ['i386',       'freebsd',   '10'],
    'i386-freebsd'        => ['i386',       'freebsd',    nil],
    'universal-freebsd'   => ['universal',  'freebsd',    nil],
    # linux
    'powerpc-linux'       => ['powerpc',    'linux',      nil],
    'i686-linux'          => ['i686',       'linux',      nil],
    'x86_64-linux'        => ['x86_64',     'linux',      nil],
    'i386-linux-gnu'      => ['i386',       'linux',      nil],
    # mswin
    'i386-mingw32'        => ['i386',       'mingw32',    nil],
    'mswin32'             => [nil,          'mswin32',    nil],
    'i386-mswin32'        => ['i386',       'mswin32',    nil],
    'i386-mswin32_80'     => ['i386',       'mswin32',   '80'],
    'i386-mswin32-80'     => ['i386',       'mswin32',   '80'],
    # netbsd
    'i386-netbsdelf'      => ['i386',       'netbsdelf',  nil],
    # openbsd
    'i386-openbsd4.0'     => ['i386',       'openbsd',   '4.0'],
    'x86_64-openbsd4.0'   => ['x86_64',     'openbsd',   '4.0'],
    # solaris
    'sparc-solaris2.10'   => ['sparc',      'solaris',   '2.10'],
    'i386-solaris2.10'    => ['i386',       'solaris',   '2.10'],
    # wince
    'i386-wince7.0'       => ['i386',       'wince',     '7.0'],
  }.each do |arch, expected|
    it "detectes #{sprintf("%-22s", "'#{arch}'")} as #{expected}" do
      platform = TTY::Platform.new(arch)
      expect(platform.to_a).to eq(expected)
    end
  end
end
