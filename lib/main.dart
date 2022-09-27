import 'package:flutter/material.dart';
import 'package:mobile_iam_poc/views/login_view.dart';
import 'package:mobile_iam_poc/views/pw_resident_list.dart';

void main() {
  runApp(const IAMLoginPOC());
}

class IAMLoginPOC extends StatelessWidget {
  const IAMLoginPOC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginView(),
    );
  }
}
