class WideFinder

  attr_accessor :filename

  def initialize(filename)
    @filename = filename
    @hit_count = Hash.new(0)
    parse_log
  end

  def parse_log
    File.open(@filename) do |file|
      while line = file.gets do
        page = line[/GET ([^? ]+)/,1]

        @hit_count[page] += 1
      end
    end
  end

  def results(num)
    @hit_count.sort{ |a,b| b[1] <=> a[1] }.take(num).map{ |x| x.reverse.join(': ')  }
  end

end