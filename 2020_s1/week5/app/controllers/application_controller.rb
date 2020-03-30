class ApplicationController < ActionController::Base
  def hello
    render html: "Hello, RMIT!"
  end
end
