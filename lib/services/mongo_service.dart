// import 'package:mongo_dart/mongo_dart.dart';

// class MongoService {
//   static late Db _db;
//   static late DbCollection _issuesCollection;

//   static Future<void> connect() async {
//     _db = await Db.create('mongodb://your_mongo_connection_url');
//     await _db.open();
//     _issuesCollection = _db.collection('issues');
//   }

//   static Future<void> addIssue(Map<String, dynamic> issueData) async {
//     await _issuesCollection.insert(issueData);
//   }

//   static Future<List<Map<String, dynamic>>> getIssues() async {
//     return await _issuesCollection.find().toList();
//   }
// }
