import 'package:dreamhome_architect/common_widgets.dart/custom_button.dart';
import 'package:dreamhome_architect/common_widgets.dart/custom_image_picker_button.dart';
import 'package:dreamhome_architect/common_widgets.dart/custom_text_formfield.dart';
import 'package:dreamhome_architect/features/home/home_screen.dart';
import 'package:dreamhome_architect/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SignupSecondScreen extends StatefulWidget {
  const SignupSecondScreen({super.key});

  @override
  State<SignupSecondScreen> createState() => _SignupSecondScreenState();
}

class _SignupSecondScreenState extends State<SignupSecondScreen> {
  final TextEditingController _licenseNoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Verify...',
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            CustomTextFormField(
                width: 350,
                labelText: 'license number',
                controller: _licenseNoController,
                validator: null),
            SizedBox(
              height: 30,
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
              onPick: (file) {},
            ),
            SizedBox(
              height: 25,
            ),
            CustomButton(
              inverse: true,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
              },
              label: 'Signup',
            )
          ],
        ),
      )),
    );
  }
}
