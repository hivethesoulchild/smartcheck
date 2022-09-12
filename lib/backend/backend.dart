import 'package:mongo_dart/mongo_dart.dart';

main() async {
  await checkUser("1", "pass");
}
Future checkUser(String username, String password) async {
  print('getting user');
  var db = await Db.create(
      "mongodb+srv://NUSMartCheck:7xwAiYXG9MiEPahb@cluster0.uletfdh.mongodb.net/NUSmartApp?retryWrites=true&w=majority");
  await db.open();

  var coll = db.collection('account');
  var res = await coll.findOne(
      where.eq("username", username).and(where.eq("password", password)));
  print(res);
  if(res == null){
    print('returned null');
    return false;
  }

  return true;
}
