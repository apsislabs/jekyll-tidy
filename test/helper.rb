# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "jekyll/tidy"
require "minitest/autorun"

def load_fixture(file)
  File.read("#{__dir__}/fixtures/#{file}")
end
