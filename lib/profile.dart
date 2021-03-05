import 'package:flutter/material.dart';
import 'package:stacklab/utils/strings.dart';
import 'package:stacklab/utils/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyProfilePage extends StatefulWidget {
  @override
  MyProfilePageState createState() {
    return MyProfilePageState();
  }
}

class MyProfilePageState extends State<MyProfilePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(Strings.myProfilePageTitle),
        ),
        body: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Image.asset('assets/images/trainer.png', width: 150),
                    const SizedBox(height: 20),
                    TextFormField(
                      style: TextStyle(fontSize: 12.0, color: Colors.black),
                      decoration: InputDecoration(
                          errorStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: Strings.myProfilePageLabel,
                          labelStyle:
                              TextStyle(fontSize: 12.0, color: Colors.red)),
                      validator: (value) {
                        if (value.isEmpty) {
                          return Strings.myProfilePageError;
                        }
                        context.read(usernameProvider).state = value;
                        return null;
                      },
                    ),
                    const SizedBox(height: 5),
                    FlatButton(
                        child: Text(Strings.myHomePageButton),
                        color: Colors.transparent,
                        textColor: Colors.white,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Navigator.pop(context);
                            context.read(signinProvider).state = true;
                          }
                        })
                  ],
                ))));
  }
}
