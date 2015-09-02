module Lita
  module Handlers
    class Parrot < Handler
      # insert handler code here
      route(/.*/, :parrot, help: { "TEXT" => "Echoes back TEXT." })

      def parrot(response)
        response.reply(response.matches)
      end
    end
    Lita.register_handler(Parrot)
  end
end
