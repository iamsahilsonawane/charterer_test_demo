import 'package:charter_flutter/presentation/bloc/auth/auth_cubit.dart';
import 'package:charter_flutter/presentation/bloc/charterer/search/search_cubit.dart';
import 'package:charter_flutter/presentation/bloc/core/theme_bloc.dart';
import 'package:charter_flutter/presentation/core/themes.dart';
import 'package:charter_flutter/presentation/core/ui_helpers.dart';
import 'package:charter_flutter/presentation/core/widgets/default_app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../injection_container.dart';
import '../../bloc/core/theme_event.dart';
import '../../core/colors.dart';
import '../../core/widgets/app_text_field.dart';

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
              onPressed: () {
                context.read<AuthCubit>().login().onError((error, stackTrace) {
                  showErrorSnackBar(context, error);
                });
              },
              child: const Text("Login"),
            ),
            verticalSpaceRegular,
            ElevatedButton(
              onPressed: () {
                if (sl.get<SharedPreferences>().get("token") != null) {
                  showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    backgroundColor:
                        context.read<ThemeBloc>().state.themeData.brightness ==
                                Brightness.dark
                            ? Colors.black.withOpacity(.9)
                            : const Color(0xFFF7F7F7),
                    builder: (BuildContext context) {
                      return StatefulBuilder(builder: (context, stful) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * .95,
                          child: const ChartererListing(),
                        );
                      });
                    },
                  );
                } else {
                  showErrorSnackBar(context, "Please login first");
                }
              },
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

class ChartererListing extends StatelessWidget {
  const ChartererListing({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultAppPadding(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(
            child: Container(
              height: 5,
              width: MediaQuery.of(context).size.width * .2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xFFC6EBF6),
              ),
            ),
          ),
          verticalSpaceRegular,
          Text(
            "Charterer",
            style: textTheme(context).titleSmall,
          ),
          verticalSpaceRegular,
          AppTextField(
            hintText: "Search",
            suffixIcon:
                const Icon(Icons.search, color: AppColors.greyIconColor),
            onChanged: (query) {
              context.read<SearchCubit>().search(query);
            },
          ),
          verticalSpaceRegular,
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: context.read<ThemeBloc>().state.themeData.brightness ==
                        Brightness.dark
                    ? const Color(0xFF161618)
                    : Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Material(
                clipBehavior: Clip.antiAlias,
                color: context.read<ThemeBloc>().state.themeData.brightness ==
                        Brightness.dark
                    ? const Color(0xFF161618)
                    : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) {
                  if (state is SearchInitial) {
                    return const Center(
                      child: Text("Search Charterer"),
                    );
                  } else if (state is SearchLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is SearchData) {
                    final results = state.results;
                    if (results.isEmpty) {
                      return const Center(
                        child: Text("Search Charterer"),
                      );
                    }
                    return ListView.builder(
                      itemCount: results.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {},
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 2),
                          title: Text(results[index],
                              style: textTheme(context).bodyMedium),
                        );
                      },
                    );
                  } else if (state is SearchError) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.error, color: Colors.red, size: 40),
                          verticalSpaceSmall,
                          Text(
                            state.error,
                            style: textTheme(context)
                                .bodySmall!
                                .copyWith(color: AppColors.greyTextColor),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text("Search Charterer"),
                    );
                  }
                }),
              ),
            ),
          ),
          verticalSpaceRegular,
          Row(
            children: [
              Flexible(
                child: Text(
                  "Can't find your Charterer? ",
                  style: textTheme(context)
                      .bodySmall!
                      .copyWith(color: AppColors.greyTextColor),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Add now",
                  style: textTheme(context)
                      .bodySmall!
                      .copyWith(color: AppColors.primaryColor),
                ),
              ),
            ],
          ),
          verticalSpaceRegular,
        ],
      ),
    );
  }
}
