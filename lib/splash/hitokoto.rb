# frozen_string_literal: true

require 'httparty'
require 'unicode/display_width'

module Splash
  # Hitokoto
  module Hitokoto

    module_function

    def sample
      response = HTTParty.get('https://v1.hitokoto.cn/', request_options)
      hitokoto = response.parsed_response

      print(hitokoto)
    rescue StandardError => e
      raise Splash::InternetError, 'no internet connection, Hitokoto show cancel.'
    end

    def print(hitokoto)
      the_print = <<-PRINT


      「#{hitokoto['hitokoto']}」

      #{' ' * hitokoto['hitokoto'].display_width}-- #{hitokoto['from']}
      PRINT

      puts the_print
    end

    def request_options
      { timeout: HTTP_DEFAULT_TIMEOUT }
    end
  end
end