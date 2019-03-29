```
bundle install
yarn install
rake db:setup
rails s
```

visit http://localhost:3000


```
rake tinkoff:sync_rates
```
Downloads currencies rates from tinkoff to rates table


![Screen](/docs/screen.png)

*Тесты предусмотрительно не написаны :)*
