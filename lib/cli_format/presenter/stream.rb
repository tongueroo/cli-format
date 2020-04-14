class CliFormat::Presenter
  class Stream
    include Enumerable

    attr_reader :buffer
    def initialize(presenter)
      @presenter = presenter
      @buffer = []
    end

    def <<(val)
      puts @presenter.format(val) if @presenter.stream?
      @buffer << val
    end

    def each
      @buffer.each do |i|
        yield(i)
      end
    end
  end
end
