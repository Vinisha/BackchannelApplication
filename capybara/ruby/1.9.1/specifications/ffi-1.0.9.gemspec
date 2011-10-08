# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ffi}
  s.version = "1.0.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Wayne Meissner}]
  s.date = %q{2011-05-21}
  s.description = %q{Ruby-FFI is a ruby extension for programmatically loading dynamic
libraries, binding functions within them, and calling those functions
from Ruby code. Moreover, a Ruby-FFI extension works without changes
on Ruby and JRuby. Discover why should you write your next extension
using Ruby-FFI here[http://wiki.github.com/ffi/ffi/why-use-ffi].}
  s.email = %q{wmeissner@gmail.com}
  s.extensions = [%q{ext/ffi_c/extconf.rb}]
  s.extra_rdoc_files = [%q{History.txt}, %q{README.rdoc}, %q{lib/ffi/platform/i386-darwin/types.conf}, %q{lib/ffi/platform/i386-linux/types.conf}, %q{lib/ffi/platform/i386-openbsd/types.conf}, %q{lib/ffi/platform/i386-solaris/types.conf}, %q{lib/ffi/platform/i386-windows/types.conf}, %q{lib/ffi/platform/powerpc-aix/types.conf}, %q{lib/ffi/platform/powerpc-darwin/types.conf}, %q{lib/ffi/platform/sparc-solaris/types.conf}, %q{lib/ffi/platform/sparcv9-solaris/types.conf}, %q{lib/ffi/platform/x86_64-darwin/types.conf}, %q{lib/ffi/platform/x86_64-linux/types.conf}, %q{lib/ffi/platform/x86_64-openbsd/types.conf}, %q{lib/ffi/platform/x86_64-solaris/types.conf}]
  s.files = [%q{History.txt}, %q{README.rdoc}, %q{lib/ffi/platform/i386-darwin/types.conf}, %q{lib/ffi/platform/i386-linux/types.conf}, %q{lib/ffi/platform/i386-openbsd/types.conf}, %q{lib/ffi/platform/i386-solaris/types.conf}, %q{lib/ffi/platform/i386-windows/types.conf}, %q{lib/ffi/platform/powerpc-aix/types.conf}, %q{lib/ffi/platform/powerpc-darwin/types.conf}, %q{lib/ffi/platform/sparc-solaris/types.conf}, %q{lib/ffi/platform/sparcv9-solaris/types.conf}, %q{lib/ffi/platform/x86_64-darwin/types.conf}, %q{lib/ffi/platform/x86_64-linux/types.conf}, %q{lib/ffi/platform/x86_64-openbsd/types.conf}, %q{lib/ffi/platform/x86_64-solaris/types.conf}, %q{ext/ffi_c/extconf.rb}]
  s.homepage = %q{http://wiki.github.com/ffi/ffi}
  s.rdoc_options = [%q{-x}, %q{ext}, %q{--main}, %q{README.rdoc}]
  s.require_paths = [%q{lib}, %q{ext}]
  s.rubyforge_project = %q{ffi}
  s.rubygems_version = %q{1.8.6}
  s.summary = %q{Ruby-FFI is a ruby extension for programmatically loading dynamic libraries, binding functions within them, and calling those functions from Ruby code}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
