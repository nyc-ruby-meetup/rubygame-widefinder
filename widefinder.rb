class WideFinder

  attr_accessor :filename

  def initialize(fname)
    @filename = fname
    f = File.open(@filename)
    @urls = {}
    f.each_line do |line|
      matches = line.match("[GET|POST] ([^?]*)?.* HTTP.*")
      if matches  
        @urls[matches[1]] = @urls[matches[1]].nil? ? 1 : @urls[matches[1]] += 1
      end
    end
    # 67.241.213.3 - - [11/Jul/2008:12:31:26 -0400] "GET /stylesheets/jquery.ui.autocomplete.css?1215793375 HTTP/1.1" 
    # /GET|POST (/.*) HTTP.*/
    # first is ip, then - - date "Get path HTTP/1.1"
  end

  def results(num_results)
    impressions = @urls.values.sort.reverse[0,num_results]

    results = []
        impressions.each do |imp|
          results.push "#{imp}: #{@urls.index(imp)}"
        end
        return results
    # return ["11101: /search/image_set/20", "8505: /search/image_set/40", "5263: /javascripts/jquery.js"]

    # Number of occurrences: path
  end

end