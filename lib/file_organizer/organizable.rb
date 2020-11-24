module FileOrganizer
  class Organizable
    attr_accessor :filename

    BASE_DIR = "/Users/#{`whoami`.chomp}"
    FILE_TYPE_ENUM = {
      document: ['text', 'txt', 'pdf'],
      picture: ['png', 'ping', 'jpeg', 'jpg', 'gif', 'svg'],
    }

    def self.create(filename)
      case extention(filename)
      when *FILE_TYPE_ENUM[:document]
        p "Detect document..."
        Document.new(filename)
      when *FILE_TYPE_ENUM[:picture]
        p "Detect pic..."
        Picture.new(filename)
      else
        p 'Detect other...'
        'other'
      end
    end

    def initialize(filename)
      @filename = filename
    end

    def new_dest
      "#{BASE_DIR}/#{folder_name}/#{filename}"
    end
    
    private

    def self.extention(filename)
      @extention ||= File.extname(filename).sub('.', '')
    end

    def folder_name
      raise NotImplementedError, "#{self.class} must implement the following method(s) #{__method__}"
    end
  end
end

# サブクラスの呼び出し
require './lib/file_organizer/organizable/document'
require './lib/file_organizer/organizable/picture'