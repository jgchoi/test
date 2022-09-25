import 'package:flutter/material.dart';
import '../services/app_auth_service.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.all(25)),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image(
                image: const AssetImage('assets/peicon.png'),
                width: screenWidth / 5,
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            const Text(
              'Practitioner Workspace Mobile',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            const Padding(padding: EdgeInsets.all(4)),
            const Text(
              'Welcome!',
              style: TextStyle(fontSize: 20),
            ),
            const Padding(padding: EdgeInsets.all(8)),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green)),
                onPressed: (() => {_signIn(context)}),
                child: const Text("Sign In")),
            const Spacer(),
            Image(
              image: const AssetImage('assets/pointclickcarelogo.png'),
              width: screenWidth / 2,
            ),
            const Padding(padding: EdgeInsets.all(8)),
          ],
        ),
      )),
    );
  }

  Future<void> _signIn(BuildContext context) async {
    await AppAuthService.shared.authorize();
    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context) => const resident()));
  }
}
