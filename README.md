# explain-db

## mongodb: explain

準備好除了 DB 之外的工具：
> https://github.com/mongodb/homebrew-brew
- 先加入 mongodb 的 formula
- mongo shell
- db command-line tools (mongoimport, mongoexport, mongodump, etc)
```bash
brew tap mongodb/brew
brew install mongodb-community-shell
brew install mongodb-database-tools
```

運行 mongodb：
```bash
make restart-mongo
```

匯入資料：
> data source from: https://www.w3resource.com/mongodb-exercises/

```bash
$ unzip data/restaurants.zip
Archive:  data/restaurants.zip
  inflating: restaurants.json

$ mongoimport --host 127.0.0.1 -d test -c restaurants --file restaurants.json
2021-10-31T20:55:34.621+0800    connected to: mongodb://127.0.0.1/
2021-10-31T20:55:34.774+0800    3772 document(s) imported successfully. 0 document(s) failed to import.
```

使用 mongo shell 連進去：
```bash
mongo
```
- 預設 connecting to: mongodb://127.0.0.1:27017/?compressors=disabled&gssapiServiceName=mongodb

explore `explain()`
```javascript
> use test
> db.restaurants.find().limit(1).pretty()
...
> let queryPlanner = db.restaurants.explain()
> let executionStats = db.restaurants.explain("executionStats")
```

create index
```javascript
> db.restaurants.createIndex( {borough: 1} )
{
	"createdCollectionAutomatically" : false,
	"numIndexesBefore" : 1,
	"numIndexesAfter" : 2,
	"ok" : 1
}
```