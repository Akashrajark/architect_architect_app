import 'package:dreamhome_architect/common_widgets.dart/custom_button.dart';
import 'package:dreamhome_architect/common_widgets.dart/custom_image_picker_button.dart';
import 'package:dreamhome_architect/common_widgets.dart/custom_text_formfield.dart';
import 'package:dreamhome_architect/features/home/home_screen.dart';
import 'package:dreamhome_architect/features/signin/signin_screen.dart';
import 'package:dreamhome_architect/theme/app_theme.dart';
import 'package:dreamhome_architect/util/value_validator.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    Future.delayed(
        const Duration(
          milliseconds: 100,
        ), () {
      User? currentUser = Supabase.instance.client.auth.currentUser;
      if (currentUser != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Create an account',
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(height: 20),
                    CustomImagePickerButton(
                      onPick: (file) {},
                    ),
                    SizedBox(height: 20),
                    CustomTextFormField(
                      labelText: 'username',
                      controller: _usernameController,
                      validator: notEmptyValidator,
                    ),
                    SizedBox(height: 15),
                    CustomTextFormField(
                      labelText: 'email',
                      controller: _emailController,
                      validator: emailValidator,
                    ),
                    SizedBox(height: 15),
                    CustomTextFormField(
                      suffixIconData: Icons.visibility,
                      labelText: 'password',
                      controller: _passwordController,
                      validator: passwordValidator,
                    ),
                    SizedBox(height: 15),
                    CustomTextFormField(
                      labelText: 'phone',
                      controller: _phoneController,
                      validator: phoneNumberValidator,
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: CustomButton(
                        inverse: true,
                        onPressed: () {
                          // if (_formkey.currentState!.validate()) {
                          //   BlocProvider.of<SignupBloc>(context).add(
                          //     SignUpUserEvent(
                          //       email: _emailController.text.trim(),
                          //       password: _passwordController.text.trim(),
                          //       userDetails: {
                          //         'email': _emailController.text.trim(),
                          //         'phone': _phoneController.text.trim(),
                          //         'user_name':
                          //             _usernameController.text.trim(),
                          //       },
                          //     ),
                          //   );
                          // }
                        },
                        label: 'Signup',
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SigninScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Log in",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
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
        ));
  }
}
