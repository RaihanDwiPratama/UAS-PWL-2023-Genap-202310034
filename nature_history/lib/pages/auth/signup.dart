import 'package:flutter/material.dart';
import 'package:nature_history/pages/auth/authstyles.dart';
import 'package:nature_history/pages/auth/signin.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void postData() async {
    var url = Uri.parse('http://localhost:8080/api/signup');
    var body = {
      'name': _nameController.text,
      'email': _usernameController.text,
      'password': _passwordController.text,
    };

    try {
      var response = await http.post(url, body: body);
      if (response.statusCode == 200) {
        // Permintaan berhasil
        print('Data berhasil dikirim');
        print(response.body);

      } else {
        // Gagal melakukan permintaan
        print('Gagal mengirim data. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      // Kesalahan dalam melakukan permintaan
      print('Terjadi kesalahan: $e');
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
                Text("Get Started", style: AuthStyles.heading),
                SizedBox(height: 10),
                Text("Create your account now", style: AuthStyles.subHeading),
                SizedBox(height: 80),
                TextFormField(
                  decoration: AuthStyles.inputFullname,
                  keyboardType: TextInputType.name,
                  controller: _nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your name";
                    } else if (value.length < 6) {
                      return "Name length cannot be less than 6 characters";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
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
                SizedBox(height: 140),
                Container(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    style: AuthStyles.button,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        postData(); // Panggil fungsi untuk melakukan POST
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => SignIn()));
                      }
                    },
                    child: Text("Sign Up", style: AuthStyles.textButton),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Have an account?", style: AuthStyles.textAccount),
                    SizedBox(width: 5),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('signin');
                      },
                      child: Text("Sign In", style: AuthStyles.textSign),
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
