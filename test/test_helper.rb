# frozen_string_literal: true

require "minitest/autorun"
require "pathname"
require "caver"
require "json"

class Caver::TestCase < MiniTest::Test
  class << self
    def setup(&block)
      define_method(:setup, &block)
    end

    def teardown(&block)
      define_method(:teardown, &block)
    end

    def test(name, &block)
      test_name = "test_#{name.gsub(/\s+/, '_')}".to_sym
      defined = instance_method(test_name) rescue false
      raise "#{test_name} is already defined in #{self}" if defined
      define_method(test_name, &block)
    end

    def fixture_path(name)
      File.expand_path("../fixtures/#{name}", __FILE__)
    end

    def files(name)
      Pathname.new fixture_path(name)
    end

    def with_abi_fixture(name)
      FileUtils.chdir fixture_path("abi") do
        Dir["**/#{name}.json"].map do |_name|
          if File.file?(_name)
            yield JSON.parse(File.read(files("abi/#{_name}"))), _name
          end
        end
      end
    end
  end

  def files(name)
    Pathname.new fixture_path(name)
  end

  def fixture_path(name)
    self.class.fixture_path(name)
  end
end
