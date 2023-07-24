import 'package:crud/views/user_list.dart';
import 'package:flutter/material.dart';
import 'provider/user_provider.dart';
import 'views/user_form.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<AppController>(
      create: (context) => AppController(), // Crie uma instância do AppController
      child: myApp(),
    ),
  );
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UserProvider(
      child: MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: Provider.of<AppController>(context).isDark ? ThemeMode.dark : ThemeMode.light, 
        home: UserList(),
        routes: {
          '/form': (context) => Userform(),
          '/list': (context) => UserList(),
        },
      ),
    );
  }
}


