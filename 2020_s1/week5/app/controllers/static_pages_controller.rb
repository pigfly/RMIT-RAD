require 'pry'

class StaticPagesController < ApplicationController
  def home
    binding.pry
    puts "program resumes here"
  end

  def help
  end

  def about
  end

  def contact
  end
end
