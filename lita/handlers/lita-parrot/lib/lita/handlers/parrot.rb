module Lita
  module Handlers
    class Parrot < Handler
      # insert handler code here
      route(/.*/, :parrot, help: { "TEXT" => "Echoes back TEXT." })

      def parrot(response)
        response.reply_privately(response.matches)
      end
      Lita.register_handler(self)
    end
  end
end
