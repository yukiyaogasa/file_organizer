module FileOrganizer
  class Organizable
    attr_accessor :filename

    BASE_DIR = "/Users/#{`whoami`.chomp}"
    FILE_TYPE_ENUM = {
      document: ['text', 'txt', 'pdf']
    }

    def initialize(filename)
      @filename = filename
    end

    def new_dest
      "#{BASE_DIR}/#{folder_name}/#{filename}"
    end
    
    private

    def extention
      @extention ||= File.extname(filename).sub('.', '')
    end

    def file_type
      case extention
      when *FILE_TYPE_ENUM[:document]
        p "Detect document..."
        'document'
      else
        p 'Detect other...'
        'other'
      end
    end

    def folder_name
      case file_type
      when 'document'
        'Documents'
      when 'picture'
        'Pictures'
      when 'csv'
        'Csvs'
      else
        'Others'
      end
    end
  end
end