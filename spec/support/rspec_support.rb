# load a data file
def data_file name
  path = Rails.root.join *%W[ spec data #{ name } ]
  File.open(path).read
end
