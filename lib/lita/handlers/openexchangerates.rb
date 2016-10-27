module Lita
  module Handlers
    class Openexchangerates < Handler
      config :app_id, type: String, required: true

      route(/^currencies$/, :list_currencies, command: true, help: {
        "currencies" => "Show valid currencies",
      })

      route(/^exchange\s(.*)$/, :exchange, command: true, help: {
        "exchange [FROM] [TO]" => "Show exchange rate FROM for TO",
      })

      def list_currencies
        chat.reply "#{currencies}"
      end

      def exchange(resp)
        from, to = resp.matches[0][1].split(" ").map{|x| x.upcase} 
      end

      private 
      def currencies
        currencies_api_url = "https://openexchangerates.org/api/currencies.json"
        req = http.get(currencies_api_url, app_id: config.app_id)
        currencies = MultiJson.load(req.body)
      end

      def convert(from, to)
        latest_exchange_rate_api_url = "https://openexchangerates.org/api/latest.json"
        req = http.get(latest_exchange_rate_api_url, app_id: config.app_id)
        exchange_rates = MultiJson.load(req.body)
      end

      Lita.register_handler(self)
    end
  end
end