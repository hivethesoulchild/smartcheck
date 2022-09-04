import 'package:mongo_dart/mongo_dart.dart';

main() async {
  await checkUser("1", "pass");
}
Future checkUser(String username, String password) async {
  var db = await Db.create(
      "mongodb+srv://NUSMartCheck:9jdFoZTyYfgPpGmT@tc.xaicy.mongodb.net/NUSmartApp?retryWrites=true&w=majority");
  await db.open();

  var coll = db.collection('account');
  var res = await coll.findOne(
      where.eq("username", username).and(where.eq("password", password)));

  if(res == null){
    return false;
  }

  return true;
}
