# frozen_string_literal: true

module Splash
  # loading text animation
  module Loading
    module_function

    def sample
      puts
      puts
      system "node #{RESOURCE_PATH}/loading.js"
    end
  end
end