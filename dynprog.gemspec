# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'dynprog/version'

Gem::Specification.new do |spec|
    spec.name        = 'dynprog'
    spec.version     = DP::VERSION
    spec.date        = '2023-04-25'
    spec.summary     = "Dynamic Programming Workaround"
    spec.description = "DP workaround showing the usage of the technique in solving problems"
    spec.authors     = ["Ernesto Espinosa"]
    spec.email       = 'e.ernesto.espinosa@gmail.com'
    spec.files       = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test)/}) }
    spec.bindir      = 'bin'
    spec.homepage    = 'https://github.com/enchf/dynprog'
    spec.license     = 'MIT'

    spec.executables << 'dp'

    spec.add_development_dependency 'byebug',  '~> 9.0'
    spec.add_development_dependency 'irb',     '~> 1.2'
    spec.add_development_dependency 'rake',    '~> 13.0'
    spec.add_development_dependency 'rubocop', '~> 0.80'
    spec.add_runtime_dependency     'curses',  '~> 1.4'
  end
