# encoding: utf-8

require_relative 'tty/cli'
require_relative 'tty/plugins'
require_relative 'tty/version'

module TTY
  class << self
    def included(base)
      base.send :extend, ClassMethods
    end
  end

  module ClassMethods
    # Return shared plugins instance
    #
    # @return [TTY::Plugins]
    #
    # @api public
    def plugins
      @plugins ||= Plugins.new
    end
  end

  extend ClassMethods
end # TTY

TTY.plugins.find('tty').load
