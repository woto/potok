namespace :tinkoff do

  desc "Скачивает и сохраняет курсы валют в Rate."
  task process_rates: :environment do
    Tinkoff::RatesService.call
  end

end
