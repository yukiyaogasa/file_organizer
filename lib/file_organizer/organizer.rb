require 'fileutils'
require './lib/file_organizer/organizable'

module FileOrganizer
  class Organizer
    attr_accessor :old_dest, :organizable
  
    def self.organize(folder, filename)
      self.new(folder, filename) do |organizer|
        FileUtils.mv(organizer.old_dest, organizer.organizable.new_dest)
      end
    end
  
    private
  
    def initialize(folder, filename)
      @old_dest = folder + filename
      @organizable = Organizable.create(filename)
  
      yield self if block_given?
    end
  end
end