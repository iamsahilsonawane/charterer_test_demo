import 'package:charter_flutter/presentation/core/ui_helpers.dart';
import 'package:charter_flutter/presentation/core/widgets/app_text_field.dart';
import 'package:charter_flutter/presentation/core/widgets/default_app_padding.dart';
import 'package:flutter/material.dart';

import '../../core/colors.dart';

class AddChartererPage extends StatefulWidget {
  const AddChartererPage({super.key});

  @override
  State<AddChartererPage> createState() => _AddChartererPageState();
}

class _AddChartererPageState extends State<AddChartererPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _countryController.dispose();
    _stateController.dispose();
    _cityController.dispose();
    _addressController.dispose();
    _websiteController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: DefaultAppPadding.onlyHorizontal(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Align(
                    alignment: Alignment.centerLeft, child: BackButton()),
                verticalSpaceMedium,
                Text(
                  "Add Charterer",
                  style: textTheme(context).headlineMedium!,
                ),
                verticalSpaceMedium,
                AppTextField(
                  hintText: "Full Name",
                  controller: _nameController,
                ),
                verticalSpaceSmall,
                AppTextField(
                  hintText: "Email",
                  controller: _emailController,
                ),
                verticalSpaceSmall,
                AppTextField(
                  hintText: "Country of residence",
                  controller: _countryController,
                ),
                verticalSpaceSmall,
                AppTextField(
                  hintText: "Phone Number",
                  controller: _phoneController,
                ),
                verticalSpaceSmall,
                AppTextField(
                  hintText: "Address",
                  controller: _addressController,
                ),
                verticalSpaceSmall,
                AppTextField(
                  hintText: "State",
                  controller: _stateController,
                ),
                verticalSpaceSmall,
                AppTextField(
                  hintText: "City",
                  controller: _cityController,
                ),
                verticalSpaceSmall,
                AppTextField(
                  hintText: "Website",
                  controller: _websiteController,
                ),
                verticalSpaceRegular,
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Want to search again? ",
                        style: textTheme(context)
                            .bodySmall!
                            .copyWith(color: AppColors.greyTextColor),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Click Here",
                        style: textTheme(context)
                            .bodySmall!
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    ),
                  ],
                ),
                verticalSpaceMedium,
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Add Charterer"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
