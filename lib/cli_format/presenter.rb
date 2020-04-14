module CliFormat
  class Presenter
    extend Memoist

    attr_accessor :header
    def initialize(options)
      @options = options
    end

    def show
      presenter_instance.show
    end

    def rows
      presenter_instance.stream
    end

    def presenter_instance
      presenter_class = "CliFormat::Presenter::#{format.classify}".constantize
      presenter_class.new(@options, @header)
    end
    memoize :presenter_instance

    # Formats: tabs, markdown, json, csv, table, etc
    def format
      @options[:format] || ENV['CLI_FORMAT'] || "table"
    end
  end
end
