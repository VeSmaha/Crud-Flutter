import 'package:crud/views/user_list.dart';
import 'package:flutter/material.dart';
import 'provider/user_provider.dart';
import 'views/user_form.dart';


void main() {
  runApp(const myApp());
}


class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UserProvider(
      child: MaterialApp(
        home: UserList(),
        routes: {
          '/form': (context) => Userform(),
          '/list':(context) => UserList(),
        },
      ),
    );
  }
}
