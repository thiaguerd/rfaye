require "rails/all"
require "rfaye/view_helpers"

module Rfaye
  class Engine < Rails::Engine
    # Adds the ViewHelpers into ActionView::Base
    initializer "rfaye.view_helpers" do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end
