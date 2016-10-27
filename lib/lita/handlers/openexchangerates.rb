module Lita
  module Handlers
    class Openexchangerates < Handler
      config :app_id, type: String, required: true

      route(/^currencies$/, :list_currencies, command: true, help: {
        "currencies" => "Show valid currencies",
      })

      route(/^exchange\s(.*)$/, :exchange, command: true, help: {
        "exchange FROM TO" => "Show exchange rate FROM for TO",
      })

      def list_currencies(chat)
        response = currencies.map {|currency, comment| "* #{currency}: #{comment}"}.join("\n")
        chat.reply "#{response}"
      end

      def exchange(chat)
        from, to = chat.matches[0][0].split(" ").map{|x| x.upcase} 
        exchange_rate = convert(from, to)
        chat.reply "#{from} -> #{to}: #{exchange_rate}"
      end

      private 
      def currencies
        currencies_api_url = "https://openexchangerates.org/api/currencies.json"
        req = http.get(currencies_api_url, app_id: config.app_id)
        currencies = MultiJson.load(req.body)
      end

      def convert(from, to)
        valid_currencies = currencies.collect {|currency, comment| currency}

        [from, to].each do |currency_code|
          unless valid_currencies.include?(currency_code)
            return "Invalid currency code, please use 'currencies' for a valid list!"
          end
        end

        latest_exchange_rate_api_url = "https://openexchangerates.org/api/latest.json"
        req = http.get(latest_exchange_rate_api_url, app_id: config.app_id)
        exchange_rates = MultiJson.load(req.body)

        exchange_rates[from] / exchange_rates[to]
      end

      Lita.register_handler(self)
    end
  end
end
