# frozen_string_literal: true

require_relative 'data_scrapper'
require_relative 'playlist_writer'

# Data composer class
class DataComposer
  include PlaylistWriter

  def compose(capybara_session)
    data_scraper = DataScraper.new(capybara_session)
    write_data(data_scraper.scrape_data)
  end
end
