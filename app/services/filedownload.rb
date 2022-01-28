module Filedownload
	class Fd
		require "down"
		
		def self.download()
			Down.download("https://fake-carrier.s3.amazonaws.com/2utw9h3rithxa4itmamcq3r5gx4m", destination: "./")
		end
  	end
end