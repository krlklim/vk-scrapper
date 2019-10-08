# frozen_string_literal: true

require_relative 'config/capybara_configuration'
require_relative 'lib/data_composer'

CapybaraConfiguration.configure
session = Capybara::Session.new(:chrome)
DataComposer.new.compose(session)
