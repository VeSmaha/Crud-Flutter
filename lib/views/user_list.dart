import 'package:crud/provider/user_provider.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';


class UserList extends StatelessWidget {
  UserList({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userprovider = UserProvider.of(context) as UserProvider;
    List<User> users = userprovider.users;
    int usersL = users.length;
    
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Align(
            alignment: Alignment.center,
            child: Text('List'),
          ),
          leading: IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.popAndPushNamed(context, '/form');
            },
          ),
        ),
        body: ListView.builder(
            itemCount: usersL,
            itemBuilder: (BuildContext contextBuilder, indexBuilder) =>
                Container(
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: 0.5))),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 5, 5),
                    child: Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            leading: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 10, 5, 5),
                              child: Icon(
                                Icons.person_2_sharp,
                                size: 40,
                              ),
                            ),
                            title: GestureDetector(
                                onTap: () {
                                  userprovider.userSelected =
                                      users[indexBuilder];
                                  userprovider.indexUser = indexBuilder;
                                  Navigator.popAndPushNamed(context, '/form');
                                },
                                child: Text(users[indexBuilder].name)),
                            subtitle: Text(users[indexBuilder].email),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              userprovider.userSelected = users[indexBuilder];
                              userprovider.indexUser = indexBuilder;
                              Navigator.popAndPushNamed(context, '/form');
                            },
                            icon: Icon(Icons.edit)),
                        IconButton(
                            color: Colors.red,
                            onPressed: () {
                              userprovider.indexUser = null;
                              userprovider.users.removeAt(indexBuilder);
                              Navigator.popAndPushNamed(context, '/list');
                            },
                            icon: Icon(Icons.delete)),
                      ],
                    ),
                  ),
                )));
  }
}
