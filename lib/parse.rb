require "open-uri"

def parse(url)
	courses = []
	open(url, 'r').read.each_line do |f|
		courses << f.gsub(/\s+/m, ' ').gsub(/^\s+|\s+$/m, '').split(' ')
	end
	courses.flatten!
	courses.delete_if {|c| c =~ /[^0-9]/ || c.length != 5}  #filter out everything that's not a 5 digit number
	courses = courses.uniq #filter out duplicates
end


# sample_url = "https://ocrsdk.blob.core.windows.net/files/7fd018aa-3c73-4175-83e7-06c5268bc011.result?sv=2012-02-12&se=2015-11-29T00%3A00%3A00Z&sr=b&si=downloadResults&sig=SXYVSOEZfpS7pfM9Kx2w1wwLrtSu%2FRMl20sG0w2uYv4%3D"


# p parse(sample_url)