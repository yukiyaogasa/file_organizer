require 'file_organizer/observer'
require "file_organizer/version"

module FileOrganizer
  class Error < StandardError; end
end

FileOrganizer::Observer.start