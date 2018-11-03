require 'simplecov'
SimpleCov.start
require "pry"
require 'minitest/autorun'
require 'minitest/pride'
require 'time'
require 'mocha/minitest'

require_relative '../lib/decryption'
require_relative '../lib/encryption'
require_relative '../lib/enigma'
require_relative '../lib/file_control'
