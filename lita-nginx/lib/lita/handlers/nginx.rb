module Lita
  module Handlers
    class Nginx < Handler
      # insert handler code here
      route(/^nginx/, :activate, command: true, help: {"help is on the way" => "maybe"}) 


      def activate(resp)
         cmd = resp.args.first
         
         case cmd
         when "restart"
         restart(resp)
	 when "lighttpd"
		 kill_light(resp)
         when "load"
		 start_site(resp)
         else
         status(resp) 
         end
      end

      def status(resp)
              state = `sudo service nginx status`
              resp.reply ("```#{state}```")
      end

      def restart(resp)
        `sudo service nginx restart`
        resp.reply ('restarting nginx')
      end

      def kill_light(resp)
	  `sudo service lighttpd stop`
	  resp.reply 'killing that other shit app'
      end

      def start_site(resp)
	      resp.reply 'shotgun'
	      `sudo service website restart`

      end

      Lita.register_handler(self)
    end
  end
end
