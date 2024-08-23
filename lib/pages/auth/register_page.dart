import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:teamchat/pages/auth/login_page.dart';
import 'package:teamchat/widgets/widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String confirmPassword = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                "TeamChat",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Sign up to Join an organization",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              Image.asset("assets/login.png"),
              TextFormField(
                decoration: textInputDecoration.copyWith(labelText: "Email"),
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
                validator: (val) {
                  return RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(val!)
                      ? null
                      : "Please enter a valid email";
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: true,
                decoration: textInputDecoration.copyWith(
                  labelText: "Password",
                ),
                validator: (val) {
                  if (val!.length < 6) {
                    return "Password is too short";
                  } else {
                    return null;
                  }
                },
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: true,
                decoration: textInputDecoration.copyWith(
                  labelText: "Confirm Password",
                ),
                validator: (val) {
                  if (val! == password) {
                    return "Password do not match";
                  } else {
                    return null;
                  }
                },
                onChanged: (val) {
                  setState(() {
                    confirmPassword = val;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 48,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4))),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    signUp();
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text.rich(
                TextSpan(
                  text: "Already have an account? ",
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                  children: <TextSpan>[
                    TextSpan(
                        text: "Login",
                        style: const TextStyle(
                            color: Colors.amber, fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            nextScreen(context, const LoginPage());
                          }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  signUp() {}
}
