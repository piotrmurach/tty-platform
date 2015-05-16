# TTY::Platform
[![Gem Version](https://badge.fury.io/rb/tty-screen.svg)][gem]

[gem]: http://badge.fury.io/rb/tty-platform

> Terminal platform query methods for detecting different operating systems.

**TTY::Platform** provides independent operating system detection component for [TTY](https://github.com/peter-murach/tty) toolkit.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tty-platform'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tty-platform

## 1. Usage

With **TTY::Platform** you can find out the properties of your operating system by creating an instance:

```ruby
platform = TTY::Platform.new
```

To query for processor name use `cpu` method:

```ruby
platform.cpu     # => 'x86_64'
```

A `nil` is returned if the value cannot be determined.

To get the system/OS name use `os` method:

```ruby
platform.os      # => 'darwin'
```

A `nil` is returned if the value cannot be determined.

To get system's release version use `version` method:

```ruby
platform.version # => '10.6.1'
```

A `nil` is returned. Note that many platforms do not provide this information.

In addition, you can use more generic methods to check the type of operating systemout of `windows`, `linux`, `mac` and `unix`:

```ruby
platform.windows?  # => false
platform.unix?     # => true
platform.linux?    # => false
platform.mac?      # => true
```

## Contributing

1. Fork it ( https://github.com/peter-murach/tty-platform/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Copyright

Copyright (c) 2015 Piotr Murach. See LICENSE for further details.
