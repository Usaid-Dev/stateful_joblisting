import 'package:flutter/material.dart';
import 'package:jobposting/screens/job_listing.dart';
import 'package:jobposting/screens/SignupScreen.dart';
import '../appbuttons.dart';
import '../textField.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff191720),
      body: Padding(
        padding: const EdgeInsets.only(top: 110, left: 27, bottom: 59, right: 27),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text("Let’s sign you in", style: TextStyle(color: Colors.white, fontSize: 35,fontWeight: FontWeight.bold)),
          const SizedBox(height: 14),
          const Text("Welcome back\nyou’ve been missed !", style: TextStyle(color: Colors.white, fontSize: 35,fontWeight: FontWeight.w300)),
          const SizedBox(height: 47),
          textfield(Placeholder: "Enter your email address"),
          textfield(Placeholder: "Enter your password"),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don’t have an account ?", style: TextStyle(fontSize: 15, color: Color(0xff8F8F9E))),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => const SignupScreen()));
                },
                child: const Text("Register", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          const SizedBox(height: 11),
          GestureDetector(
            onTap: () {
              onpress(context);
            },
            child: appbuttons(
                label: "Sign in",
                onPress: () {
                  onpress(context);
                }),
          )
        ]),
      ),
    );
  }
}

onpress(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const listjobs()));
}
