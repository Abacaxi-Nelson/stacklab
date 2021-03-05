import 'package:flutter/material.dart';
import 'package:stacklab/utils/strings.dart';
import 'package:stacklab/utils/button.dart';
import 'package:stacklab/utils/app_bar_title.dart';
import 'package:stacklab/profile.dart';
import 'package:stacklab/utils/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final username = context.read(usernameProvider).state;
    return Scaffold(
        appBar: AppBar(
          title: AppBarTitle(title: Strings.accountTitle),
        ),
        body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset('assets/images/trainer.png', width: 150),
                const SizedBox(height: 20),
                const Text(
                  Strings.accountName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
                const SizedBox(height: 10),
                Text(
                  username,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
                const SizedBox(height: 20),
                CustomButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      context.read(signinProvider).state = false;
                    },
                    title: Strings.accountLogount)
              ],
            )));
  }
}
