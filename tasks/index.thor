require 'colorize'

class Create < Thor
  include Thor::Actions

  desc "component", "create a new component".yellow
  def component
    ask "Choose the name of you component (like a variable):".green
    empty_directory
  end
end
