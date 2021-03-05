import 'package:flutter/material.dart';
import 'package:stacklab/utils/strings.dart';
import 'package:stacklab/utils/button.dart';
import 'package:stacklab/utils/app_bar_title.dart';
import 'package:stacklab/profile.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus.unfocus();
    }

    return Scaffold(
        appBar: AppBar(
          title: AppBarTitle(title: Strings.myHomePageTitle),
        ),
        body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/professor_oak.png', width: 150),
                const SizedBox(height: 20),
                const Text(
                  Strings.myHomePageWelcome,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
                const SizedBox(height: 20),
                CustomButton(
                    onPressed: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyProfilePage()));
                    },
                    title: Strings.myHomePageButton)
              ],
            )));
  }
}
