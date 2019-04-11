# coding: utf-8

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "caver/version"

Gem::Specification.new do |s|
  s.name    = "caver-ruby"
  s.version = Caver::VERSION
  s.summary = "Unofficial Ruby client library for Klaytn"
  s.author  = "Jiwoong Heo"
  s.email   = "jw.heo@piction.network"
  s.files   = Dir["lib/**/*"]

  s.add_dependency "digest-sha3", "~> 1.1"
  s.add_dependency "activesupport", ">= 5.2.2"
  s.add_dependency "activemodel", ">= 5.2.2"

  s.add_development_dependency "minitest", "~> 5.11"
  s.add_development_dependency "bundler", "~> 2.0"
  s.add_development_dependency "rake", "~> 10.0"
end
