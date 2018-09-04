# frozen_string_literal: true

# default by rails
class HomeController < ApplicationController
  def index
    if Video.count > 10
      rands = Array.new(10) { rand(1..Video.last.id) }
      @videos = []
      rands.each do |t|
        @videos << Video.find(t)
      end
    end
  end
end
