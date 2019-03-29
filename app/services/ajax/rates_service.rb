# NOTE Я не использую тут кеширование. Нет я про него не забыл :)
class Ajax::RatesService

  def initialize(rate_form)
    @rates = Rate
      .where(receive_date: rate_form.from..rate_form.to)
      .select("from_currency", "to_currency", "receive_date", "buy", "sell")
  end

  def exists?
    @rates.exists?
  end

  def graph
    grouped = @rates.group_by { |item| item['from_currency'] }
    available_dates = grouped.first[1].map(&:receive_date)

    datasets = grouped.flat_map do |k, v|
      ['buy', 'sell'].map do |t|
        {
          label: "#{Rate::CODES[k.to_s]} #{t}",
          data: v.map { |item| item.send(t).to_f },
        }
      end
    end

    json = {
      labels: available_dates,
      datasets: datasets
    }
  end
end
