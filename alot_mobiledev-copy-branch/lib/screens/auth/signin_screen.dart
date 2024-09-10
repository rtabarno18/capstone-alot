import 'package:alot_mobiledevelopment/config/routes.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter_svg/flutter_svg.dart'; // Import the flutter_svg package
import '../../controllers/auth_controller.dart'; // Import the AuthController

@RoutePage()
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _resetPasswordEmailController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthController _authController = AuthController();

  bool isResetPasswordLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'johndoe@gmail.com',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: '************',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 137.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () async {
                  try {
                    setState(() => _authController.isLoading = true);
                    User? user = await _authController.signInWithEmail(
                      _emailController.text,
                      _passwordController.text,
                    );

                    if (user != null) {
                      String role = await _authController.getUserRole(user.uid);
                      setState(() => _authController.isLoading = false);

                      if (role == 'barber') {
                        context.router.replaceAll([const BarberHomeRoute()]);
                      } else {
                        context.router.replaceAll([const ClientHomeRoute()]);
                      }
                    } else {
                      setState(() => _authController.isLoading = false);
                    }
                  } catch (e) {
                    setState(() => _authController.isLoading = false);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Sign in error: $e')),
                    );
                  }
                },
                child: _authController.isLoading
                    ? const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(color: Colors.white),
                      )
                    : const Text(
                        'Login',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => context.router.push(SignUpRoute()),
                child: const Text(
                  "Don't have an account? SignUp",
                  style: TextStyle(color: Colors.purple),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () async {
                  await showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    builder: (_) {
                      return StatefulBuilder(
                        builder: (context, setState) => Container(
                          margin: MediaQuery.of(context).viewInsets,
                          padding: const EdgeInsets.fromLTRB(24, 24, 24, 48),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('Forgot Password?'),
                              const Text(
                                  'Enter email address to send a reset password.'),
                              const SizedBox(height: 20),
                              TextField(
                                controller: _resetPasswordEmailController,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  hintText: 'johndoe@gmail.com',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purple,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 15.0,
                                      horizontal: 100.0,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  onPressed: () async {
                                    try {
                                      setState(
                                          () => isResetPasswordLoading = true);
                                      await _authController
                                          .resetPasswordViaEmail(
                                        context,
                                        _resetPasswordEmailController.text,
                                      );

                                      setState(
                                          () => isResetPasswordLoading = false);
                                      context.router.maybePop();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'Password reset sent successfully.'),
                                        ),
                                      );
                                    } catch (e) {
                                      setState(
                                          () => isResetPasswordLoading = false);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(content: Text('Error: $e')),
                                      );
                                    }
                                  },
                                  child: isResetPasswordLoading
                                      ? const SizedBox(
                                          height: 24,
                                          width: 24,
                                          child: CircularProgressIndicator(
                                              color: Colors.white),
                                        )
                                      : const Text(
                                          'Reset Password',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                  _resetPasswordEmailController.clear();
                },
                child: const Text(
                  'Forgot your Password?',
                  style: TextStyle(color: Colors.purple),
                ),
              ),
              const SizedBox(height: 30),
              const Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      height: 36,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("Or Login using"),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      height: 36,
                    ),
                  ),
                ],
              ),
              // const SizedBox(height: 10),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Container(
              //         padding: const EdgeInsets.all(8.0),
              //         child: IconButton(
              //           icon: SvgPicture.asset('assets/icons/twitter.svg'), // Use SvgPicture.asset
              //           iconSize: 40,
              //           onPressed: () {
              //             // Handle Twitter login
              //           },
              //         ),
              //       ),
              //       const SizedBox(width: 20),
              //       Container(
              //         padding: const EdgeInsets.all(8.0),
              //         child: IconButton(
              //           icon: SvgPicture.asset('assets/icons/google.svg'), // Use SvgPicture.asset
              //           iconSize: 40,
              //           onPressed: () {
              //             // Handle Google login
              //           },
              //         ),
              //       ),
              //       const SizedBox(width: 20),
              //       Container(
              //         padding: const EdgeInsets.all(8.0),
              //         child: IconButton(
              //           icon: SvgPicture.asset('assets/icons/facebook.svg'), // Use SvgPicture.asset
              //           iconSize: 40,
              //           onPressed: () {
              //             // Handle Facebook login
              //           },
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    ));
  }
}
