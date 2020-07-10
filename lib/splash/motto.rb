# frozen_string_literal: true

require 'motto'

module Splash
  # 格言
  module Motto

    module_function

    def sample
      motto = ::Motto.new.sample
      who   = `cowsay -l`.split.drop(4).sample
      system "cowsay -f #{who} \"#{motto}\""
    end

  end
end