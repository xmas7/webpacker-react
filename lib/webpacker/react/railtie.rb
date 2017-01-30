require "rails/railtie"

module Webpacker
  module React
    class Engine < ::Rails::Engine
      initializer :webpacker_react do
        ActiveSupport.on_load(:action_controller) do
          ActionController::Base.helper ::Webpacker::React::Helpers
        end
      end

      initializer :webpacker_react_renderer, group: :all do |app|
        ActionController::Renderers.add :react_component do |component_name, options|
          props = options.fetch(:props, {})
          html = Webpacker::React::Component.new(component_name).render(props)
          render_options = options.merge(inline: html)
          render(render_options)
        end
      end
    end
  end
end
