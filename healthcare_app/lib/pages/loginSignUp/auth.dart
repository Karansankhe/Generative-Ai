import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() {
    return _AuthScreenState();
  }
}

class _AuthScreenState extends State<AuthScreen> {
  final _form = GlobalKey<FormState>();

  var _isLogin = true;
  var _enteredEmail = '';
  var _enteredPassword = '';
  var _enteredUsername = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _form,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  // welcome back, you've been missed!
                  Text(
                    _isLogin ? 'Welcome back!' : "Create New Account",
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    _isLogin
                        ? 'Please sign in to your account '
                        : "Enter your details to create the account",
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // username textfield
                  if (!_isLogin)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        // controller: usernameController,
                        obscureText: false,
                        enableSuggestions: false,
                        autocorrect: false,
                        textCapitalization: TextCapitalization.none,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: HexColor("#7168d3"), width: 2),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: HexColor("#7168d3"), width: 2),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Full Name",
                          hintStyle: TextStyle(color: Colors.grey[500]),
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.trim().length < 4) {
                            return 'Please enter at least 4 characters.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _enteredUsername = value!;
                        },
                      ),
                    ),

                  // email textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      // controller: usernameController,
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: HexColor("#7168d3"), width: 2),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: HexColor("#7168d3"), width: 2),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.grey[500]),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.trim().isEmpty ||
                            !value.contains('@')) {
                          return 'Please enter a valid email address.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _enteredEmail = value!;
                      },
                    ),
                  ),

                  // password textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      // controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: HexColor("#7168d3"), width: 2),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: HexColor("#7168d3"), width: 2),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.grey[500]),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().length < 6) {
                          return 'Password must be at least 6 characters long.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _enteredPassword = value!;
                      },
                    ),
                  ),

                  // sign in button
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 30),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: HexColor("#7168d3"),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                        child: Text(
                          _isLogin ? "Sign In" : "Sign Up",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'OR',
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                    child: Text(
                      'Continue with',
                    ),
                  ),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SquareTile(imagePath: 'assets/icons/apple.png'),
                      SizedBox(width: 30),
                      SquareTile(imagePath: 'assets/icons/facebook.png'),
                      SizedBox(width: 30),
                      SquareTile(imagePath: 'assets/icons/google.png')
                    ],
                  ),

                  const SizedBox(height: 50),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _isLogin ? 'Don\'t hava an account?' : "Already have an Account?",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 4),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _isLogin = !_isLogin;
                          });
                        },
                        child: Text(
                          _isLogin ? 'Sign Up' : "Sign In",
                          style: TextStyle(
                            color: HexColor("#7168d3"),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SquareTile extends StatelessWidget {
  final String imagePath;
  const SquareTile({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        imagePath,
        height: 40,
      ),
    );
  }
}