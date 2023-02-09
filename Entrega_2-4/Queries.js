db.restaurants.find( {});
db.restaurants.find( {} , {restaurant_id: 1, name: 1, borough: 1, cuisine: 1});
db.restaurants.find( {} , {restaurant_id: 1, name: 1, borough: 1, cuisine: 1, _id:0});
db.restaurants.find( {} , {restaurant_id: 1, name: 1, borough: 1, address: {zipcode: 1}, _id:0});
db.restaurants.find({borough: "Bronx"});
db.restaurants.find({borough: "Bronx"}).limit(5);
db.restaurants.find({borough: "Bronx"}).limit(5).skip(5);
db.restaurants.find({grades: {$elemMatch: { score: {$gt: 90}}}});
db.restaurants.find({grades: {$elemMatch: { score: {$gt: 80, $lte: 100}}}});
db.restaurants.find({'address.coord.1': {$gt: -95.754168}});
db.restaurants.find({$and: [{cuisine: {$not: {$regex: /American/}}}, {grades: {$elemMatch: { score: {$gt: 70}}}}, {'address.coord.1': {$gt: -65.754168}}]});
db.restaurants.find({$nor: [{cuisine: {$regex:/American\s/} }, {grades:{$not:{$elemMatch:{score:{$gt:70}}}}}, {"address.coord.0" : {$gt : -65.754168}}]});
db.restaurants.find({$and: [{cuisine: {$not: {$regex: /American/}}}, {grades: {$elemMatch: { grade: 'A'}}}, {borough: {$not: {$regex: /Brooklyn/}}}]}).sort({cuisine: -1});
db.restaurants.find( {name: {$regex: /^Wil/}} , {restaurant_id: 1, name: 1, borough: 1, cuisine: 1, _id:0});
db.restaurants.find( {name: {$regex: /ces$/}} , {restaurant_id: 1, name: 1, borough: 1, cuisine: 1, _id:0});
db.restaurants.find( {name: {$regex: /Reg/}} , {restaurant_id: 1, name: 1, borough: 1, cuisine: 1, _id:0});
db.restaurants.find({$and: [{borough:"Bronx"}, {$or: [{cuisine:'Chinese'}, {cuisine: 'American'}]}]});
db.restaurants.find( {$or: [{borough:"Staten Island"}, {borough:"Queens"} , {borough:"Bronx"}, {borough:"Brooklyn"} ]}, {restaurant_id: 1, name: 1, borough: 1, cuisine: 1, _id:0});
db.restaurants.find( {$nor: [{borough:"Staten Island"}, {borough:"Queens"} , {borough:"Bronx"}, {borough:"Brooklyn"}]}, {restaurant_id: 1, name: 1, borough: 1, cuisine: 1, _id:0});
db.restaurants.find({"grades.0.score": { $lte: 10 }}, {restaurant_id: 1, name: 1, borough: 1, cuisine: 1 });
db.restaurants.find({$and: [{cuisine: { $ne: "American " }}, {cuisine: { $ne: "Chinese" }}, {$or:[{name: {$regex: /fish/i}},{name: {$regex: /^Wil/i}}]} ] }, {restaurant_id: 1, name: 1, borough: 1, cuisine: 1 });
db.restaurants.find({ grades: {$elemMatch: { score: 11, date: ISODate("2014-08-11T00:00:00Z") }}, "grades.grade": "A" }, { restaurant_id: 1, name: 1, grades: 1 });
db.restaurants.find({ "grades.1.score": 9, "grades.1.date": ISODate("2014-08-11T00:00:00Z"), "grades.1.grade": "A" }, { restaurant_id: 1, name: 1, grades: 1 });
db.restaurants.find({$and:[{"address.coord.1":{$gt:42}}, {"address.coord.1":{$lte:52}}]}, {_id:0, restaurant_id: 1, name: 1, address: 1 });
db.restaurants.find().sort({name: 1});
db.restaurants.find().sort({name: -1});