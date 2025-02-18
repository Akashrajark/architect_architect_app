import 'package:dreamhome_architect/common_widgets.dart/custom_button.dart';
import 'package:dreamhome_architect/common_widgets.dart/custom_image_picker_button.dart';
import 'package:dreamhome_architect/common_widgets.dart/custom_text_formfield.dart';
import 'package:dreamhome_architect/theme/app_theme.dart';
import 'package:dreamhome_architect/util/value_validator.dart';
import 'package:flutter/material.dart';

class CreateHomePlan extends StatefulWidget {
  const CreateHomePlan({super.key});

  @override
  State<CreateHomePlan> createState() => _CreateHomePlanState();
}

class _CreateHomePlanState extends State<CreateHomePlan> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController desController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController floorNameController = TextEditingController();
  final TextEditingController floorDesController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        actions: [
          CustomButton(
            inverse: true,
            onPressed: () {},
            label: 'add Floor',
            iconData: Icons.add,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Text(
              'Add homeplan image',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10,
            ),
            CustomImagePickerButton(
              height: 200,
              width: 400,
              onPick: (file) {},
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Add homeplan title',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextFormField(
                labelText: 'Title',
                controller: titleController,
                validator: notEmptyValidator),
            SizedBox(
              height: 10,
            ),
            Text(
              'Add homeplan description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextFormField(
                labelText: 'description',
                controller: desController,
                validator: notEmptyValidator),
            SizedBox(
              height: 10,
            ),
            Text(
              'Add homeplan price',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextFormField(
                labelText: 'price',
                controller: priceController,
                validator: notEmptyValidator),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Floor 1',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                CustomButton(
                  inverse: true,
                  onPressed: () {},
                  label: 'Remove floor',
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Floor name',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextFormField(
                labelText: 'FloorName 1',
                controller: floorNameController,
                validator: notEmptyValidator),
            SizedBox(
              height: 10,
            ),
            Text(
              'Floor description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextFormField(
                labelText: 'FloorDescription 1',
                controller: floorDesController,
                validator: notEmptyValidator),
            SizedBox(height: 20),
            CustomImagePickerButton(
              height: 200,
              width: 400,
              onPick: (file) {},
            ),
            SizedBox(height: 20),
            CustomButton(
              inverse: true,
              onPressed: () {},
              label: 'Upload',
            )
          ],
        ),
      ),
    );
  }
}
