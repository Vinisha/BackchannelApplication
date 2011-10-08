# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{json_pure}
  s.version = "1.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Florian Frank}]
  s.date = %q{2011-09-12}
  s.description = %q{This is a JSON implementation in pure Ruby.}
  s.email = %q{flori@ping.de}
  s.extra_rdoc_files = [%q{README.rdoc}]
  s.files = [%q{README.rdoc}]
  s.homepage = %q{http://flori.github.com/json}
  s.rdoc_options = [%q{--title}, %q{JSON implemention for ruby}, %q{--main}, %q{README.rdoc}]
  s.require_paths = [%q{lib}]
  s.rubyforge_project = %q{json}
  s.rubygems_version = %q{1.8.6}
  s.summary = %q{JSON Implementation for Ruby}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<permutation>, [">= 0"])
      s.add_development_dependency(%q<bullshit>, [">= 0"])
      s.add_development_dependency(%q<sdoc>, [">= 0"])
      s.add_development_dependency(%q<rake>, ["~> 0.9.2"])
    else
      s.add_dependency(%q<permutation>, [">= 0"])
      s.add_dependency(%q<bullshit>, [">= 0"])
      s.add_dependency(%q<sdoc>, [">= 0"])
      s.add_dependency(%q<rake>, ["~> 0.9.2"])
    end
  else
    s.add_dependency(%q<permutation>, [">= 0"])
    s.add_dependency(%q<bullshit>, [">= 0"])
    s.add_dependency(%q<sdoc>, [">= 0"])
    s.add_dependency(%q<rake>, ["~> 0.9.2"])
  end
end
