class WideFinder
  
  attr_accessor :filename
  
  def initialize(logfile)
    @filename = logfile
  end

  def results(num)
    file_to_hash.sort_by{|k,v| -v }.take(num).map{|x| x.reverse.join(": ") }
  end

  def file_to_hash
    output = Hash.new
    File.open(@filename,"r").each_line{|line|
      file = line[/(GET|POST) ([^? ]*)/,2]
      output[file] = 0 unless output.key? file
      output[file] = output[file] + 1
    }
    output
  end

end
