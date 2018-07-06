require "copy/version"
require 'clipboard'

module Copy
  def copy(*arguments)
    if arguments.any?
      Clipboard.copy(arguments.map(&:to_s).join("\n"))
    else
      Clipboard.paste
    end
  end
  alias c copy
  alias cc copy
end
