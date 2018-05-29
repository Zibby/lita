module Lita
  module Handlers
    class Top < Handler
      # insert handler code here
      route(/top/, :activate, command: true, help: {"nah" => "dump"})

      def activate(resp)
	      mpstat = `/usr/bin/mpstat`
	      procs = `ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10`
	      resp.reply("```#{mpstat}```")
	      resp.reply("```#{procs}```")

      end

      Lita.register_handler(self)
    end
  end
end
