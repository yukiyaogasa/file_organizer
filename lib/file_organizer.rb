require 'fssm'
require 'pry'
require 'fileutils'

class FileOrganizer
  attr_accessor :old_dest, :organizable

  def self.organize(folder, filename)
    self.new(folder, filename) do |organizer|
      # p organizer.old_dest, organizer.organizable.new_dest
      FileUtils.mv(organizer.old_dest, organizer.organizable.new_dest)
    end
  end

  private

  def initialize(folder, filename)
    @old_dest = folder + filename
    @organizable = Organizable.new(filename)

    yield self if block_given?
  end
end

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

class FileObserver
  BASE_DIR = "/Users/#{`whoami`.chomp}"

  attr_reader :folder

  def self.start(folder)
    self.new(folder) do |observer|
      p observer
      p "Start observing #{observer.tracking_folder}..."
      FSSM.monitor(observer.tracking_folder,'**/*') do
        create do |base, filename|
          observer.create_action(observer.tracking_folder, filename)
        end
      end
    end
  end

  def tracking_folder
    "#{BASE_DIR}/#{folder}/"
  end

  def create_action(tracking_folder, filename)
    open('log.txt', 'a'){|f|
      f.puts tracking_folder  + filename + " was created at " + `date`
    }
    FileOrganizer.organize(tracking_folder, filename)
  end

  private

  def initialize(folder)
    @folder = folder

    yield self if block_given?
  end
end

FileObserver.start('downloads')