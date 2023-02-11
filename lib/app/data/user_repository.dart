import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';

import 'user.dart';

class UserRepository {

  Future<User> getUser() async {
    final index = Random().nextInt(5) + 1;
    final path = 'assets/user$index.json';
    final data = await rootBundle.loadString(path);
    final map = jsonDecode(data);

    return User.fromMap(map);
  }

}