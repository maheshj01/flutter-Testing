import 'package:dbcrypt/dbcrypt.dart';

class Password {
  static String hash() {
    var plainPassword = "some_password";
    // var hashedPassword =
    //     new DBCrypt().hashpw(plainPassword, new DBCrypt().gensalt());
    return plainPassword;
  }
}
