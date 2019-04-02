# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name    = "caver-ruby"
  s.version = "0.0.1"
  s.summary = "Unofficial Ruby client library for Klaytn"
  s.author  = "Jiwoong Heo"
  s.email   = "jw.heo@piction.network"
  s.files   = Dir["lib/**/*"]

  s.add_dependency "activesupport", ">= 5.2.2"
  s.add_dependency "activemodel", ">= 5.2.2"
end
