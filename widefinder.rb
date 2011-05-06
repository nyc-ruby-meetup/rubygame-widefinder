class WideFinder
  
  attr_accessor :filename
  
  def initialize(logfile)
    @logfile = logfile
  end

  def results(num)
    hash = file_to_hash
    res1 = hash.sort_by{|k,v| -v}
    res2 = []
    res1[0..(num-1)].each{|o|
      res2 << "#{o[1]}: #{o[0]}"
    }
    res2
  end

  def file_to_hash
    output = Hash.new
    File.open(@logfile,"r").each_line{|line|
      file = line[/(GET|POST) ([^? ]*)/,2]
      output[file] = 0 unless output.key? file
      output[file] = output[file] + 1
    }
    output
  end

end
