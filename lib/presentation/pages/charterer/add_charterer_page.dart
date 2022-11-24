import 'package:charter_flutter/app_utils.dart';
import 'package:charter_flutter/presentation/core/ui_helpers.dart';
import 'package:charter_flutter/presentation/core/widgets/app_text_field.dart';
import 'package:charter_flutter/presentation/core/widgets/default_app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/charterer/create/create_charterer_cubit.dart';
import '../../core/colors.dart';

class AddChartererPage extends StatefulWidget {
  const AddChartererPage({super.key});

  @override
  State<AddChartererPage> createState() => _AddChartererPageState();
}

class _AddChartererPageState extends State<AddChartererPage> {
  final _formKey = GlobalKey<FormState>();

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
            child: BlocListener<CreateChartererCubit, CreateChartererState>(
              listenWhen: (previous, current) =>
                  current is CreateChartererError ||
                  current is CreateChartererSuccess,
              listener: (context, state) {
                if (state is CreateChartererError) {
                  showErrorSnackBar(context, state.error);
                }
                if (state is CreateChartererSuccess) {
                  showSnackBar(context,
                      message: "Charterer added successfully");
                }
              },
              child: Form(
                key: _formKey,
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
                      validator: AppUtils.fieldEmpty,
                    ),
                    verticalSpaceSmall,
                    AppTextField(
                      hintText: "Email",
                      controller: _emailController,
                      validator: AppUtils.emailValidate,
                    ),
                    verticalSpaceSmall,
                    AppTextField(
                      hintText: "Country of residence",
                      controller: _countryController,
                      validator: AppUtils.fieldEmpty,
                    ),
                    verticalSpaceSmall,
                    AppTextField(
                      hintText: "Phone Number",
                      controller: _phoneController,
                      validator: AppUtils.phoneValidate,
                    ),
                    verticalSpaceSmall,
                    AppTextField(
                      hintText: "Address",
                      controller: _addressController,
                      validator: AppUtils.fieldEmpty,
                    ),
                    verticalSpaceSmall,
                    AppTextField(
                      hintText: "State",
                      controller: _stateController,
                      validator: AppUtils.fieldEmpty,
                    ),
                    verticalSpaceSmall,
                    AppTextField(
                      hintText: "City",
                      controller: _cityController,
                      validator: AppUtils.fieldEmpty,
                    ),
                    verticalSpaceSmall,
                    AppTextField(
                      hintText: "Website",
                      controller: _websiteController,
                      validator: AppUtils.fieldEmpty,
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
                    BlocBuilder<CreateChartererCubit, CreateChartererState>(
                        builder: (context, state) {
                      return ElevatedButton(
                        onPressed: state is! CreateChartererLoading
                            ? () async {
                                if (_formKey.currentState!.validate()) {
                                  final data = {
                                    "chartererDetails": {
                                      "name": _nameController.text,
                                      "email": _emailController.text,
                                      "phoneNumber": _phoneController.text,
                                      "country": _countryController.text,
                                      "state": _stateController.text,
                                      "city": _cityController.text,
                                      "address1": _addressController.text,
                                      "address2": "",
                                      "website": _websiteController.text,
                                      "contactPerson": "XYZ",
                                    }
                                  };
                                  await context
                                      .read<CreateChartererCubit>()
                                      .createCharterer(data);
                                }
                              }
                            : null,
                        child: state is! CreateChartererLoading
                            ? const Text("Add Charterer")
                            : const Text("Creating..."),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
