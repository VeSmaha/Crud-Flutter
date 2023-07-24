import 'package:crud/widgets/field_form.dart';
import 'package:crud/models/user_model.dart';
import 'package:flutter/material.dart';
import '../provider/user_provider.dart';

class Userform extends StatefulWidget {
  const Userform({super.key});

  @override
  State<Userform> createState() => _UserformState();
}

class _UserformState extends State<Userform> {
  String title = 'Create User';
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    int? index;
    UserProvider userProvider = UserProvider.of(context) as UserProvider;
    if (userProvider.indexUser != null) {
      setState(() {
        title = 'Edit User';
      });
      index = userProvider.indexUser;
      controllerName.text = userProvider.userSelected!.name;
      controllerEmail.text = userProvider.userSelected!.email;
      controllerPassword.text = userProvider.userSelected!.password;
    }
    GlobalKey<FormState> _key = GlobalKey();

   
    void save() {
      final isValidate = _key.currentState?.validate();
      if (isValidate == false) {
        return;
      }
   _key.currentState?.save();


      User user = User(
          controllerName.text, controllerEmail.text, controllerPassword.text);

      if (index != null) {
        userProvider.users[index] = user;
        userProvider.indexUser = null;
      } else {
        int usersL = userProvider.users.length;
        // print(user.name);
        userProvider.users.insert(usersL, user);
      }
      Navigator.popAndPushNamed(context, '/list');
    }

    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Scaffold(
          appBar: AppBar(
            title: Align(alignment: Alignment.center, child: Text(title)),
            actions: [
              Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: IconButton(
                    onPressed: () {
                      userProvider.indexUser = null;
                      Navigator.popAndPushNamed(context, '/list');
                    },
                    icon: Icon(Icons.home),
                  )),
            ],
            backgroundColor: Colors.black,
          ),
          body: Center(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
            child: Form(
              key: _key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FieldForm(
                    label: 'Name',
                    isPassword: false,
                    controller: controllerName,
                    isEmail: false,
                  ),
                  FieldForm(
                    label: 'Email',
                    isPassword: false,
                    controller: controllerEmail,
                    isEmail: true,
                  ),
                  FieldForm(
                    label: 'Password',
                    isPassword: true,
                    controller: controllerPassword,
                    isEmail: false,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        // fixedSize: Size(170, 44),
                      ),
                      onPressed: () {
                        save();
                      },
                      child: Text('Salvar', style: TextStyle(fontSize: 20)))
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}
