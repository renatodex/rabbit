class Controller
  def self.get(action_arr, route, &block)
    App.class_eval do |c|
      get "#{route}" do
        yield(self)
        erb action_arr.last, views: "app/#{action_arr[0]}/views/#{action_arr[1]}"
      end
    end
  end
end
