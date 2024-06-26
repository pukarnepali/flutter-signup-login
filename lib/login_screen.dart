import 'package:flutter/material.dart';
import 'package:sign_up/home_screen.dart';
import 'package:sign_up/local_storage.dart';
import 'package:sign_up/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to Login",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 14,
            ),
            TextField(
              controller: emailcontroller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: "Email",
                hintText: "example@gmail.com",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: passwordcontroller,
              obscureText: isVisible,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      isVisible = !isVisible;
                      setState(() {});
                    },
                    icon: Icon(Icons.remove_red_eye)),
                prefixIcon: Icon(Icons.key),
                labelText: "Password",
                hintText: "********",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 3, 36, 184),
                  foregroundColor: Colors.white),
              onPressed: () async {
                var localStorage = StorageHelper();
                var saveEmail = await localStorage.getUser("email");
                var savePassword = await localStorage.getUser("password");
                if (emailcontroller.text == saveEmail &&
                    passwordcontroller.text == savePassword) {
                  await localStorage.saveData(true);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                    (route) => (false),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Invalid Credential"),
                    ),
                  );
                }
              },
              child: Text("Login"),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignupScreen()));
                  },
                  child: Text("Signup"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
