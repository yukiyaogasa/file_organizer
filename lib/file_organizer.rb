require 'fssm'
require 'pry'
require 'fileutils'

BASE_DIR = "/Users/#{`whoami`.chomp}"
FOLDER_TO_TRACK = "#{BASE_DIR}/downloads/"
FILE_TYPE_ENUM = {
  document: ['text', 'txt', 'pdf']
}

def create_action(base, file)
  open('log.txt', 'a'){|f|
    f.puts base + "/"  + file + " was created at " + `date`
  }
  old_dest = FOLDER_TO_TRACK + file
  ext = File.extname(file).sub('.', '')
  case ext
  when *FILE_TYPE_ENUM[:document]
    p "Detect document..."
    FileUtils.mv(FOLDER_TO_TRACK + file, new_dest(file, 'document'))
  else
    p 'Detect other...'
  end
end

def update_action(base, file)
  open('log.txt', 'a'){|f|
    f.puts base + "/"  + file + " was updated at " + `date`
  }
end

def delete_action(base, file)
  open('log.txt', 'a'){|f|
    f.puts base + "/" + file + " was deleted at " + `date`
  }
end

def new_dest(file_name, file_type)
  folder_name = case file_type
  when 'document'
    'Documents'
  when 'picture'
    'Pictures'
  when 'csv'
    'Csvs'
  else
    'Others'
  end
  "#{BASE_DIR}/#{folder_name}/#{file_name}"
end
  


p "監視対象 #{FOLDER_TO_TRACK}"
FSSM.monitor(FOLDER_TO_TRACK,'**/*') do
 
  create do |base,file|
      create_action(base, file)
  end
  update do |base,file|
      update_action(base, file)
  end
   delete do |base,file|
      delete_action(base, file)
  end
 
 end
