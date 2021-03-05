import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stacklab/utils/providers.dart';

class AuthWidget extends ConsumerWidget {
  const AuthWidget({
    Key key,
    @required this.signedInBuilder,
    @required this.nonSignedInBuilder,
  }) : super(key: key);
  final WidgetBuilder nonSignedInBuilder;
  final WidgetBuilder signedInBuilder;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final isSignIn = watch(signinProvider).state;
    if (isSignIn) {
      return signedInBuilder(context);
    }
    return nonSignedInBuilder(context);
  }
}
