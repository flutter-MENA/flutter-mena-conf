import 'package:flutter/material.dart';
import 'package:mena_conf/ui/pages/main_app/main_app_view_model.dart';
import 'package:mena_conf/ui/routes.dart';
import 'package:stacked/stacked.dart';

class MainAppView extends StackedView<MainAppViewModel> {

  const MainAppView({super.key});

  @override
  MainAppViewModel viewModelBuilder(BuildContext context) => MainAppViewModel();

  @override
  Widget builder(BuildContext context, MainAppViewModel viewModel, Widget? child) {
    return MaterialApp.router(
      title: 'Flutter MENA Conference',
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        brightness: Brightness.light
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            brightness: Brightness.dark,
          ),
          brightness: Brightness.dark,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: Colors.deepPurple,
            unselectedItemColor: Colors.white,
            type: BottomNavigationBarType.shifting,
            showSelectedLabels: true,
          ),
      ),
      routerConfig: router,
    );
  }

}