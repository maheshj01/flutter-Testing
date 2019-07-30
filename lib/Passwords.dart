import 'package:dbcrypt/dbcrypt.dart';

class Password {
  static String hash() {
    var plainPassword = "ihcomtisd@121";
    // var hashedPassword =
    //     new DBCrypt().hashpw(plainPassword, new DBCrypt().gensalt());
    return plainPassword;
  }
}
