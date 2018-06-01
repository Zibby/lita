# frozen_string_literal: true

module Lita
  module Handlers
    # Comment this at some point
    class Docker < Handler
      # insert handler code here
      route(/docker/, command: true) do |response|
        cmd = 'docker ps -a --format'
        dockers = `#{cmd} "{{.Names}}: {{.Status}}  {{.Ports}}" | column -t`
        response.reply("```#{dockers}```")
      end
      Lita.register_handler(self)
    end
  end
end
