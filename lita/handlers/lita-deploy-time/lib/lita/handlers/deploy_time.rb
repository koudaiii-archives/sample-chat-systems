module Lita
  module Handlers
    class DeployTime < Handler
      route(/^\[wantedly:production\].*invoked\s'deploy'/, :deploy_start_time)
      route(/^\[wantedly:production\].*invoked\s'deploy:unlock'/, :deploy_finish_time)

      def deploy_start_time(response)
        log.debug "start deploy message: #{reponse}"
        # deploy_time = { id: nil,started_at: Time.now, finished_at: nil, account_name: user(response) }
      end

      def deploy_finish_time(response)
        log.debug "finish deploy message: #{reponse}"
      end

      def user(response)
        log.debug "#{response.matches[0].to_s.match(/\s(.+?)\sinvoked\s'deploy.*'/)[1]}"
        response.matches[0].to_s.match(/\s(.+?)\sinvoked\s'deploy.*'/)[1]
      end
      Lita.register_handler(self)
    end
  end
end
