# frozen_string_literal: true

module Helpers
  # Helper method to read a json file
  #
  # @return [Hash]
  def load_json(file)
    JSON.parse(File.open("./spec/support/api/v1/#{file}.json").read).deep_symbolize_keys
  end
end
