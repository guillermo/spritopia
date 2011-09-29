# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "spritopia/version"

Gem::Specification.new do |s|
  s.name        = "spritopia"
  s.version     = Spritopia::VERSION
  s.authors     = ["Guillermo Álvarez"]
  s.email       = ["guillermo@cientifico.net"]
  s.homepage    = ""
  s.summary     = %q{A sprite generator that don't output in css}
  s.description = %q{Maybe some day it can, but not for the moment}

  s.rubyforge_project = "spritopia"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "minitest"
  s.add_development_dependency "rake"
  s.add_runtime_dependency "chunky_png"
  s.add_runtime_dependency "oily_png"
	s.add_runtime_dependency "json"
	s.add_runtime_dependency "thor"
end
