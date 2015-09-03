# lita-slack-watch

[![Build Status](https://travis-ci.org/koudaiii/lita-slack-watch.png?branch=master)](https://travis-ci.org/koudaiii/lita-slack-watch)
[![Coverage Status](https://coveralls.io/repos/koudaiii/lita-slack-watch/badge.png)](https://coveralls.io/r/koudaiii/lita-slack-watch)

slack watch plugin.


## Installation

**lita-slack-watch** is a watch for [Lita](https://github.com/jimmycuadra/lita) that allows you to use the robot with [Slack](https://slack.com/). This watch complements

**lita-slack-watch** sets up an HTTP route to accept messages from Slack:Outgoing WebHooks integrations, then feeds it into Lita.

Add lita-slack-watch to your Lita instance's Gemfile:

``` ruby
gem "lita-slack"
gem "lita-slack-watch"
```

## Configuration
**First, you need to make sure your Slack team has [Outgoing WebHooks](https://my.slack.com/services/new/outgoing-webhook) integration setup with the correct Trigger Word(s) and URL:**

```
http://<Lita_server>:<Lita_port>/lita/slack-watch
```


### Required attributes

* `webhook_token` (String) – Slack integration token.
* `team_domain` (String) – Slack team domain; subdomain of slack.com.


## Sample Configuration

``` ruby
Lita.configure do |config|

  # Lita's HTTP port is used for Slack integration
  config.http.port = 8080
  # lita-slack-watch config
  config.watchs.slack_watch.webhook_token = ENV["SLACK_WEBHOOK_TOKEN"] #ex: Cq9wq3TAJp5FGCsUbpzhrKrR
  config.watchs.slack_watch.team_domain = ENV["SLACK_TEAM_DOMAIN"]#ex: koudaiii
  # Some more adapter and other config
  # .....
end
```
