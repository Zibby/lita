module Lita
  module Handlers
    class Top < Handler
      # insert handler code here
      route (/^top/, :activate, command: true)

      def activate(resp)
	      mpstat = `/usr/bin/mpstat`
	      procs = `ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10`
	      reps.reply("```#{mpstat}```")
	      reps.reply("```#{procs}```")

      end

      Lita.register_handler(self)
    end
  end
end
