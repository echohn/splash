# frozen_string_literal: true

require 'pickup'
require 'pathname'
require 'pp'
require_relative 'splash/version'
require_relative 'splash/graphic'
require_relative 'splash/hitokoto'
require_relative 'splash/loading'
require_relative 'splash/motto'
require_relative 'splash/poetry'

# Splash
module Splash
  class InternetError < StandardError; end

  RESOURCE_PATH = Pathname.new(File.join(__dir__, '../resources'))

  HTTP_DEFAULT_TIMEOUT = 3

  module_function

  def sample
    # 当 SHELL 处于 screen 或 tmux 时，跳过 sample 执行
    return if ENV['TERM']&.match?(/screen/)

    send(pickup)
    puts
    puts
  rescue Splash::InternetError => e
    puts e.message
    puts
    send(pickup_when_no_internet)
    puts
    puts
  end

  def pickup
    probability = {
      show_a_graphics: 10,
      show_a_motto: 40,
      show_loading_text: 2,
      show_a_hitokoto: 20,
      show_a_poetry: 20
    }

    pickup = Pickup.new(probability)
    pickup.pick
  end

  def pickup_when_no_internet
    probability = {
      show_a_graphics: 10,
      show_a_motto: 40,
      show_loading_text: 2
    }

    pickup = Pickup.new(probability)
    pickup.pick
  end

  def show_a_graphics
    Splash::Graphic.sample
  end

  def show_a_motto
    Splash::Motto.sample
  end

  def show_loading_text
    Splash::Loading.sample
  end

  def show_a_hitokoto
    Splash::Hitokoto.sample
  end

  def show_a_poetry
    Splash::Poetry.sample
  end

  def test
    methods
      .select { |m| m.match?(/^show_/) }
      .each { |m| send(m) }
  end
end
