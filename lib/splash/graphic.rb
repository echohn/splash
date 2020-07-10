# frozen_string_literal: true

module Splash
  # 图画
  module Graphic

    module_function

    def sample
      graphics = Dir["#{RESOURCE_PATH}/graphics/*"].sample
      system "cat #{graphics}"
    end
  end
end