import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var _formKey = GlobalKey<FormState>();
  bool isVisible = true;
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController addresscontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                TextFormField(
                  controller: namecontroller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: "Name",
                    hintText: "Pukar Nepali",
                    border: OutlineInputBorder(),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your name";
                    } else if (value.length < 8) {
                      return "Name should be atleast of 8 letters";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: addresscontroller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.location_history),
                    labelText: "Address",
                    hintText: "Pokhara, Kaski",
                    border: OutlineInputBorder(),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your address";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: "Email",
                    hintText: "example@gmail.com",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                    obscureText: isVisible,
                    controller: passwordcontroller,
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a password";
                      } else if (value.length < 6) {
                        return "Please enter a valid";
                      } else if (!RegExp(
                              r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()_+\-=\[\]{};:\\|,.<>\/?]).{8,}$')
                          .hasMatch(value)) {
                        return "Please enter a valid password";
                      } else {
                        return null;
                      }
                    }),
                SizedBox(height: 15),
                TextFormField(
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please confirm password";
                    } else if (value != passwordcontroller.text) {
                      return "Password doesn't match!";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 3, 36, 184),
                      foregroundColor: Colors.white),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Account created succssfully")));
                    }
                  },
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
        ),
      ),
    );
  }
}
