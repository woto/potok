namespace :tinkoff do

  desc "Скачивает и сохраняет курсы валют в Rate"
  task sync_rates: :environment do
    Tinkoff::SyncService.call
  end

end
