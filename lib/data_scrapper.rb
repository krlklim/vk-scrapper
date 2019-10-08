# frozen_string_literal: true

require 'yaml'
require 'pry'
require_relative '../constants'

# Data scrape class
class DataScraper
  include Constants

  def initialize(capybara_session)
    @session = capybara_session
  end

  def scrape_data
    scrapper_scenario
    [scrape_artist, scrape_track_name]
  end

  def scrapper_scenario
    visit_vk_page
    input_vk_user_data
    log_in
    personal_audio
    scroll_down_page
  end

  private

  def visit_vk_page
    @session.visit VK_PATH
  end

  def user_data
    YAML.load_file('env/data.yml')
  end

  def input_vk_user_data
    @session.find(INPUT_PHONE_TAG)
            .set(user_data['user']['vk_credentials']['phone'])
    @session.find(INPUT_PASSWORD_TAG)
            .set(user_data['user']['vk_credentials']['password'])
  end

  def log_in
    @session.first('button', text: LOGIN).click
  end

  def personal_audio
    sleep(2)
    @session.find(AUDIO_SECTION).click
  end

  def scrape_track_name
    @session.all(TRACK_NAME).map(&:text)
  end

  def scrape_artist
    @session.all(TRACK_ARTIST).map(&:text)
  end

  def scroll_down_page
    20.times do
      @session.execute_script(SCROLL_SCRIPT)
      sleep(2)
    end
    sleep(2)
  end
end
