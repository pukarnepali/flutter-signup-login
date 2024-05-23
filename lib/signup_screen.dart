import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
              "Welcome to Signup",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 14,
            ),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: "Name",
                hintText: "Pukar Nepali",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.location_history),
                labelText: "Address",
                hintText: "Pokhara, Kaski",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: "Email",
                hintText: "example@gmail.com",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
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
            TextField(
              obscureText: isVisible,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      isVisible = !isVisible;
                      setState(() {});
                    },
                    icon: Icon(Icons.remove_red_eye)),
                prefixIcon: Icon(Icons.key),
                labelText: "Confirm Password",
                hintText: "********",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 3, 36, 184),
                  foregroundColor: Colors.white),
              onPressed: () {},
              child: Text("Create Account"),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an accout"),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Login"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
