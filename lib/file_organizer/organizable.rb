module FileOrganizer
  class Organizable
    attr_accessor :filename

    BASE_DIR = "/Users/#{`whoami`.chomp}"
    FILE_TYPE_ENUM = {
      document: [/text/, /txt/, /pdf/],
      picture: [/png/, /ping/, /jpeg/, /jpg/, /gif/, /svg/],
      screenshot: [/スクリーンショット/],
    }

    def self.create(filename)
      case filename
      when *FILE_TYPE_ENUM[:screenshot]
        p "Detect Screenshot..."
        Screenshot.new(filename)
      when *FILE_TYPE_ENUM[:document]
        p "Detect document..."
        Document.new(filename)
      when *FILE_TYPE_ENUM[:picture]
        p "Detect pic..."
        Picture.new(filename)
      else
        p 'Detect other...'
      end
    end

    def initialize(filename)
      @filename = filename
      create_dir_if_not_exist
    end

    def new_dest
      "#{BASE_DIR}/#{folder_name}/#{filename}"
    end
    
    private

    def folder_name
      raise NotImplementedError, "#{self.class} must implement the following method(s) #{__method__}"
    end

    def create_dir_if_not_exist
      FileUtils.mkdir(dir_path) unless Dir.exist?(dir_path)
    end

    def dir_path
      BASE_DIR + '/' + folder_name
    end
  end
end

# サブクラスの呼び出し
require './lib/file_organizer/organizable/document'
require './lib/file_organizer/organizable/picture'
require './lib/file_organizer/organizable/screenshot'