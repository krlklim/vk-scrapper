# frozen_string_literal: true

require_relative '../constants'
require 'pry'

# PlaylistWriter module which creates txt parsed playlist
module PlaylistWriter
  include Constants

  def write_data(vk_data)
    File.open("#{Time.now}_playlist.txt", 'w') do |file|
      file << separated_data(vk_data).join("\n")
    end
  end

  def compared_data(vk_data)
    vk_data.first.drop(1).zip(vk_data.last)
  end

  def separated_data(vk_data)
    compared_data(vk_data).map { |data| data.join(' - ') }
  end
end
