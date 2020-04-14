class CliFormat::Presenter
  class Tab < Base
    def text
      @present_buffer << @header.join("\t") if @header
      @stream.each do |row|
        @present_buffer << format(row)
      end
      @present_buffer.join("\n")
    end

    def format(row)
      row.join("\t")
    end
  end
end
