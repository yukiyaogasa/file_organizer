require 'fssm'
require 'pry'
require 'fileutils'

class FileOrganizer
  attr_accessor :file_name, :tracking_folder, :old_dest, :organizable

  def self.organize(file_name, tracking_folder)
    self.new(file_name, tracking_folder) do |organizer|
      FileUtils.mv(organizer.old_dest, organizer.organizable.new_dest)
    end
  end

  private

  def initialize(file_name, tracking_folder)
    @file_name = file_name
    @tracking_folder = tracking_folder
    @old_dest = tracking_folder + file_name
    @organizable = Organizable.new(file_name)

    yield self if block_given?
  end
end

class Organizable
  attr_accessor :file_name

  BASE_DIR = "/Users/#{`whoami`.chomp}"
  FILE_TYPE_ENUM = {
    document: ['text', 'txt', 'pdf']
  }

  def initialize(file_name)
    @file_name = file_name
  end

  def new_dest
    "#{BASE_DIR}/#{folder_name}/#{file_name}"
  end
  
  private

  def extention
    @extention ||= File.extname(file_name).sub('.', '')
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
  FOLDER_TO_TRACK = "#{BASE_DIR}/downloads/"

  def initialize
    p "監視対象 #{FOLDER_TO_TRACK}"
    FSSM.monitor(FOLDER_TO_TRACK,'**/*') do
      create do |base,file|
        open('log.txt', 'a'){|f|
          f.puts base + "/"  + file + " was created at " + `date`
        }
        FileOrganizer.organize(file, FOLDER_TO_TRACK)
      end
      # update do |base,file|
      #   update_action(base, file)
      # end
      # delete do |base,file|
      #   delete_action(base, file)
      # end
    end
  end

  def aa
    p 'aa'
  end

  def create_action(base, file)
    open('log.txt', 'a'){|f|
      f.puts base + "/"  + file + " was created at " + `date`
    }
    FileOrganizer.organize(file, FOLDER_TO_TRACK)
  end
  
  # def update_action(base, file)
  #   open('log.txt', 'a'){|f|
  #     f.puts base + "/"  + file + " was updated at " + `date`
  #   }
  # end
  
  # def delete_action(base, file)
  #   open('log.txt', 'a'){|f|
  #     f.puts base + "/" + file + " was deleted at " + `date`
  #   }
  # end
end

FileObserver.new