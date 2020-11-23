require 'fssm'
require './lib/file_organizer/organizer'

module FileOrganizer
  class Observer
    BASE_DIR = "/Users/#{`whoami`.chomp}"
  
    attr_reader :folder
  
    # デフォルトでdownloadsディレクトリを監視
    def self.start(folder = 'downloads')
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
      Organizer.organize(tracking_folder, filename)
    end
  
    private
  
    def initialize(folder)
      @folder = folder
  
      yield self if block_given?
    end
  end  
end