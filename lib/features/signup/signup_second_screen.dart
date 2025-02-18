import 'dart:io';

import 'package:dreamhome_architect/common_widgets.dart/custom_button.dart';
import 'package:dreamhome_architect/common_widgets.dart/custom_image_picker_button.dart';
import 'package:dreamhome_architect/common_widgets.dart/custom_text_formfield.dart';
import 'package:dreamhome_architect/features/home/home_screen.dart';
import 'package:dreamhome_architect/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common_widgets.dart/custom_alert_dialog.dart';
import '../../util/permission_handler.dart';
import 'sign_up_bloc/sign_up_bloc.dart';

class SignupSecondScreen extends StatefulWidget {
  final Map signupDetails;
  const SignupSecondScreen({super.key, required this.signupDetails});

  @override
  State<SignupSecondScreen> createState() => _SignupSecondScreenState();
}

class _SignupSecondScreenState extends State<SignupSecondScreen> {
  final TextEditingController _licenseNoController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  File? licensefile, profilephoto;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      requestStoragePermission();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: BlocProvider(
        create: (context) => SignUpBloc(),
        child: BlocConsumer<SignUpBloc, SignUpState>(
          listener: (context, state) {
            if (state is SignUpFailureState) {
              showDialog(
                context: context,
                builder: (context) => CustomAlertDialog(
                  title: 'Failure',
                  description: state.message,
                  primaryButton: 'Try Again',
                  onPrimaryPressed: () {
                    Navigator.pop(context);
                  },
                ),
              );
            } else if (state is SignUpSuccessState) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (route) => false,
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Verify...',
                      style:
                          TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomTextFormField(
                      width: 350,
                      labelText: 'license number',
                      controller: _licenseNoController,
                      validator: null,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomImagePickerButton(
                      onPick: (file) {
                        profilephoto = file;
                        setState(() {});
                      },
                    ),
                    Text(
                      'Provide your License photo here',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomImagePickerButton(
                      width: 350,
                      height: 190,
                      onPick: (file) {
                        licensefile = file;
                        setState(() {});
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    CustomButton(
                      inverse: true,
                      onPressed: () {
                        if (_formKey.currentState!.validate() &&
                            profilephoto != null &&
                            licensefile != null) {
                          Map<String, dynamic> details = {
                            'name': widget.signupDetails['name'],
                            'email': widget.signupDetails['email'],
                            'phone': widget.signupDetails['phone'],
                            'license_no': _licenseNoController.text.trim(),
                          };
                          if (profilephoto != null) {
                            details['photo_file'] = profilephoto!;
                            details['photo_name'] = profilephoto!.path;
                          }
                          if (licensefile != null) {
                            details['license_file'] = licensefile!;
                            details['license_name'] = licensefile!.path;
                          }
                          BlocProvider.of<SignUpBloc>(context).add(
                            InsertUserDataEvent(
                              userDetails: details,
                            ),
                          );
                        }
                      },
                      label: 'Signup',
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
