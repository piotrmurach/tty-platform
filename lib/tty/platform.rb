# coding: utf-8

require 'tty/platform/version'

module TTY
  # Detects system platform properties
  #
  # @api public
  class Platform
    WINDOWS_PATTERN = /(cygwin|mswin|mingw|bccwin|wince|emx)/i

    UNIX_PATTERN = /(aix|arch|darwin|linux|(net|free|open)bsd|cygwin|solaris|irix|hpux)/i

    LINUX_PATTERN = /linux|arch/i

    MAC_PATTERN = /darwin/i

    # Returns processor name, e.g. 'amdk6'
    #
    # @api public
    attr_reader :cpu

    # Returns the system/OS name, e.g. 'darwin'
    #
    # @api public
    attr_reader :os

    # Returns system's release version, e.g. '10.8.1'
    #
    # @api public
    attr_reader :version

    # Create platform properties
    #
    # @api public
    def initialize(arch = nil)
      @cpu, @os, @version = *detect_system_properties(arch)
    end

    # Add operating system query methods
    constants.grep(/PATTERN/).each do |pattern|
      name = pattern.to_s.split('_').first.downcase
      system_query = :"#{name}?"
      define_method(system_query) do
        match_os?(self.class.const_get(pattern))
      end
      self.class.class_eval do
        define_method(system_query) do
          new.public_send(system_query)
        end
      end
    end

    # Detect if using windows path delimiter
    #
    # @return [Boolean]
    #
    # @api public
    def windows_file_path?
      ::File::ALT_SEPARATOR == '\\'
    end

    # Check if platform matches given systems
    #
    # @return [Boolean]
    #
    # @api public
    def match_os?(matcher)
      !!(@os =~ matcher)
    end

    # Queries for system architecture information
    #
    # @return [String]
    #
    # @api public
    def architecture
      RbConfig::CONFIG['arch']
    end

    # @return [Array[String]]
    #
    # @api public
    def to_a
      [@cpu, @os, @version]
    end

    # String representation
    #
    # @api public
    def to_s
      to_a.compact.join('-')
    end

    private

    # Infer system properties from architecture information
    #
    # @return [Array[String, String String]]
    #
    # @api private
    def detect_system_properties(arch)
      parts = (arch || architecture).split('-', 2)

      if parts.length == 1
        @cpu, system = nil, parts.shift
      else
        @cpu, system = *parts
      end
      @os, @version = *find_os_and_version(system)
      [@cpu, @os, @version]
    end

    # @param [String] system
    #
    # @api private
    def find_os_and_version(system)
      case system
      when /aix(\d+(\.\d+)*)?/         then ['aix',       $1]
      when /bccwin(\d+(\.\d+)*)?/      then ['bccwin',    $1]
      when /bitrig(\d+(\.\d+)*)?/      then ['bitrig',    $1]
      when /cygwin/                    then ['cygwin',    nil]
      when /darwin(\d+(\.\d+)*)?/      then ['darwin',    $1]
      when /emx/                       then ['emx',       nil]
      when /freebsd(\d+(\.\d+)*)?/     then ['freebsd',   $1]
      when /linux(\d+(\.\d+)*)?/       then ['linux',     $1]
      when /mingw32/                   then ['mingw32',   nil]
      when /(mswin\d+)((\_|-)(\d+))?/  then [$1,          $4]
      when /netbsdelf/                 then ['netbsdelf', nil]
      when /openbsd(\d+(\.\d+)*)?/     then ['openbsd',   $1]
      when /solaris(\d+(\.\d+)*)?/     then ['solaris',   $1]
      when /wince(\d+(\.\d+)*)?/       then ['wince',     $1]
      else ['unknown', nil]
      end
    end
  end # Platform
end # TTY
