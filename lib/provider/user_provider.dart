import 'package:crud/models/user_model.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends InheritedWidget {
  UserProvider({super.key, required this.child}) : super(child: child) {
    users.add(User('Veronica', 'veronica@outlook.com', 'senha456'));
    users.add(User('Valter', 'valter@gmail.com', 'senha123'));
  }
  User? userSelected;
  List<User> users = [];

  int? indexUser;
  final Widget child;

  static UserProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserProvider>();
  }

  @override
  bool updateShouldNotify(UserProvider oldWidget) {
    return true;
  }
}
