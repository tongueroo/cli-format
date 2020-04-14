class CliFormat::Presenter
  class Base
    attr_accessor :stream
    def initialize(options, header)
      @options, @header = options, header
      @stream = Stream.new(self)
      @present_buffer = []
    end

    def stream?
      !!@options[:stream]
    end

    def show
      puts text
    end
  end
end
