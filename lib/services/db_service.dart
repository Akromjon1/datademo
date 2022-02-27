import 'package:hive/hive.dart';

import '../pages/model/user.dart';

class HiveDB{
  var box = Hive.box("pdp");
  void storeUser(User user) async{
    box.put("user", user.toJson());
  }
  User loadUser(){
    var user = new User.fromJson(box.get('user'));
    return user;
}
  void removeuser() async{
    box.delete('user');
  }
}