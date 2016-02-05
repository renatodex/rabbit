class ApplicationRouter
  def self.define
    yield(ApplicationRouterMethods.new)
  end
end

class ApplicationRouterMethods
  attr_accessor :_component
  attr_accessor :_instance

  def initialize
    self._instance = self
  end

  def component(value)
    self._component = value
  end

  def set_locals(app, action_class)
    action_class.instance_variables.inject({}) do |obj, iv|
      obj[iv.to_s[1..-1].to_sym] = action_class.instance_variable_get(iv.to_s)
      obj
    end
  end

  # Magic method generation based on most used HTTP Verbs
  [:get, :post, :delete, :put].each do |method|
    define_method(method.to_sym) { |route, controller_action|
      component = self._component
      instance = self

      # Opening the App class and Adding all mapped routes
      App.class_eval do |c|
        self.send(:get, "#{route}", &-> {
          klass_instance = "#{component.to_s.camelize}::#{controller_action.first.to_s.camelize}_controller".camelize.constantize.new

          # 1. Execute the action logic.
          klass_instance.send(controller_action.last.to_sym)

          # 2. Render the view, passing the correct locals
          # (basicly it returns a Hash containing all instance variables from controller action)
          erb controller_action.last,
            views: "app/#{component}/views/#{controller_action.first}",
            locals: instance.set_locals(app, klass_instance)
        })
      end
    }
  end
end
