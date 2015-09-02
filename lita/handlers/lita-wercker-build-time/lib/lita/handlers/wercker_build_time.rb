require 'time'
module Lita
  module Handlers
    class WerckerBuildTime < Handler
      # insert handler code here
      route(/.*passed/, :build_time, help: { "TEXT" => "Echoes back TEXT." })

      def build_time(response)
        build_no = get_build_no(response)
        wercker_build_status = set_wercker_status(build_no)
        log.debug "#{wercker_build_status}"
        response.reply(wercker_build_status)
      end

      def get_build_no(response)
        log.debug "(#{response.matches[0].to_s.match(/https:\/\/app\.wercker\.com\/.build\/(.+?)\|/)[1]})"
        response.matches[0].to_s.match(/https:\/\/app\.wercker\.com\/.build\/(.+?)\|/)[1]
      end

      def set_wercker_status(build_no)
          http_response = http.get(
            "https://app.wercker.com/api/v3/builds/" + build_no,
            Authorization: "Bearer 4f9b462ada7c5ab4ab9bec67eb9c0833f958f4b5de0301764f45df5ae263b4f9"
          )
          data = MultiJson.load(http_response.body)
          log.debug "#{data}"
          started_at = Time.parse(data["createdAt"])
          finished_at = Time.parse(data["finishedAt"])
          duration_min = (finished_at - started_at).to_i/60
          wercker_build_status = {started_at: started_at, finished_at: finished_at, duration_min: duration_min}
          log.debug "#{started_at},#{finished_at},#{duration_min}"
          return wercker_build_status
      end
      Lita.register_handler(self)
    end
  end
end
