module Tinkoff
  class SyncService
    def self.call
      res = RestClient.get('https://www.tinkoff.ru/api/v1/currency_rates/')
      json = JSON.parse(res.body)
      # NOTE Если бы данных было бы много, то использовал бы что-то типа gem activerecord-import
      json['payload']['rates'].each do |item|
        next if item['category'] != 'DepositPayments'
        next unless item['toCurrency']['name'] == 'RUB'
        # NOTE Для тестового задания уславливаюсь, что валюта не меняется чаще, чем раз в сутки (напр. как у ЦБРФ)
        # TODO Для поиска достаточно сочетания receive_date, from_currency, to_currency. А также наложить на них индекс
        Rate.find_or_create_by(
          receive_date: Date.current,
          from_currency: item['fromCurrency']['code'],
          to_currency: item['toCurrency']['code'],
          buy: item['buy'],
          sell: item['sell'])
      end
      nil
      # NOTE Тут мы обычно отправляем сигнал в datadog, что по-пути ничего не отвалилось.
      # А там например, применительно к этой таске проверяем, чтобы она выполнялась не реже, чем раз в сутки
    end
  end
end
