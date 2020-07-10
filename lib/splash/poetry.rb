# frozen_string_literal: true

require 'httparty'

module Splash
  # Poetry
  module Poetry

    module_function

    def sample
      response = HTTParty.get('https://v2.jinrishici.com/sentence', request_options)

      poetry = response.parsed_response['data']

      print(poetry)

    rescue StandardError => e
      raise Splash::InternetError, 'no internet connection, Poetry show cancel.'
    end

    def print(poetry)
      content = poetry['origin']['content'].join.gsub(/。/, "。\n\t")
      the_print = <<-PRINT

      「#{poetry['content']}」

          #{poetry['origin']['title']}
            #{poetry['origin']['dynasty']} • #{poetry['origin']['author']}

      \t#{content}
      PRINT

      puts the_print
    end

    def request_options
      # https://v2.jinrishici.com/token

      token = '8JJZb10mv29vKNNjY7x4SFwenNZgnF+U'

      {
        headers: {
          'X-User-Token' => token
        },
        timeout: HTTP_DEFAULT_TIMEOUT
      }
    end
  end
end