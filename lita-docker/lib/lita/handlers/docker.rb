module Lita
  module Handlers
    class Docker < Handler
      # insert handler code here
	    route(/docker/, command: true) do |response|
		    dockers = `docker ps -a --format "{{.Names}}: {{.Status}}  {{.Ports}}" | column -t`
		  response.reply("```#{dockers}```")
	    end

      Lita.register_handler(self)
    end
  end
end
