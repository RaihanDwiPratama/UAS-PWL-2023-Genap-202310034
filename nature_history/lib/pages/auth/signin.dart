import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nature_history/pages/auth/authstyles.dart';
import 'package:nature_history/pages/home/home.dart';
import 'package:nature_history/utils/colors.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void signIn() async {
    final url = Uri.parse('http://localhost:8080/api/signin');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': _usernameController.text,
          'password': _passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        // Login berhasil
        print('Login successful');
        if (responseData['message'] == 'Login successful') {
          print('Login successful');
          print(response.body);
          print('Name: ${responseData['name']}');
          print('Token: ${responseData['token']}');

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Home()),
          );
        }
      } else {
        // Login gagal, email atau password tidak valid
        print('Sign In Failed');
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Sign In Failed'),
            content: const Text('Invalid email or password.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      print('Terjadi kesalahan: $e');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Sign In Failed'),
          content: const Text('An error occurred during sign in.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 180),
            child: Column(
              children: [
                SizedBox(height: 90),
                Text("Hello Again!", style: AuthStyles.heading),
                SizedBox(height: 10),
                Text(
                  "Welcome back, you've been missed!",
                  style: AuthStyles.subHeading,
                ),
                SizedBox(height: 80),
                TextFormField(
                  decoration: AuthStyles.inputUsername,
                  keyboardType: TextInputType.emailAddress,
                  controller: _usernameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter an email";
                    } else if (!_validateEmail(value)) {
                      return "Please enter a valid email";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                TextFormField(
                  maxLength: 10,
                  obscureText: true,
                  decoration: AuthStyles.inputPassword,
                  keyboardType: TextInputType.text,
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter a password";
                    } else if (value.length < 6) {
                      return "Password length should be at least 6 characters";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                      fillColor: MaterialStateProperty.all(AppColors.secondary),
                    ),
                    SizedBox(width: 15),
                    Text("Remember me", style: AuthStyles.rememberMe),
                    Spacer(),
                    Text("Forgot Password", style: AuthStyles.forgotPassword),
                  ],
                ),
                SizedBox(height: 163),
                Container(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    style: AuthStyles.button,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        signIn();
                      }
                    },
                    child: Text("Sign In", style: AuthStyles.textButton),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",
                        style: AuthStyles.textAccount),
                    SizedBox(width: 5),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('signup');
                      },
                      child: Text("Sign Up", style: AuthStyles.textSign),
                    ),
                  ],
                ),
                SizedBox(height: 90),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _validateEmail(String email) {
    final RegExp emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
    return emailRegex.hasMatch(email);
  }
}
