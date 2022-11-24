import 'package:charter_flutter/presentation/bloc/core/theme_bloc.dart';
import 'package:charter_flutter/presentation/core/themes.dart';
import 'package:charter_flutter/presentation/core/ui_helpers.dart';
import 'package:charter_flutter/presentation/core/widgets/default_app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/core/theme_event.dart';
import '../../core/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Add Charterer'),
        icon: const Icon(Icons.add),
        extendedTextStyle: const TextStyle(letterSpacing: 0),
        backgroundColor: AppColors.primaryColor,
      ),
      body: DefaultAppPadding(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text.rich(
              TextSpan(text: "Welcome to the\n", children: [
                TextSpan(
                  text: "Charterer",
                  style: textTheme(context).headlineMedium!,
                )
              ]),
              style: textTheme(context).headlineMedium!.copyWith(
                  color: Colors.grey[600], fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            verticalSpaceRegular,
            ElevatedButton(
              onPressed: () {},
              child: const Text("Login"),
            ),
            verticalSpaceRegular,
            ElevatedButton(
              onPressed: () {},
              child: const Text("Search"),
            ),
            verticalSpaceMedium,
            SwitchListTile(
              title: const Text("Dark Mode"),
              value: context.watch<ThemeBloc>().state.themeData.brightness ==
                  Brightness.dark,
              onChanged: (switchToDark) {
                final selectedTheme =
                    switchToDark ? AppTheme.darkTheme : AppTheme.lightTheme;

                context
                    .read<ThemeBloc>()
                    .add(ThemeEvent(appTheme: selectedTheme));
              },
            ),
          ],
        ),
      ),
    );
  }
}
