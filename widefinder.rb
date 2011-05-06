class WideFinder
  
  attr_accessor :filename
  
  def initialize(logfile)
    @logfile = File.open(logfile,"r").read.split("\n")
    @counter = {}
  end

  def results(num)
    add_to_hash
    res1 = @counter.sort_by{|k,v| -v}
    res2 = []
    res1[0..(num-1)].each{|o|
      res2 << "#{o[1]}: #{o[0]}"
    }
    res2
  end

  def add_to_hash
    @logfile.each{|l|
      file = l.split(" ")[6].split("?")[0]
      @counter[file] = 0 unless @counter.key? file
      @counter[file] = @counter[file] + 1
    }
  end

end
