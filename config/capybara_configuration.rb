# frozen_string_literal: true

require 'capybara'

# Capybara configuration module
module CapybaraConfiguration
  def self.configure
    Capybara.register_driver :chrome do |app|
      Capybara::Selenium::Driver.new(app, browser: :chrome)
    end
  end
end
