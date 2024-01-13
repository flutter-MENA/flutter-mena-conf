import 'package:flutter/material.dart';
import 'package:mena_conf/ui/pages/home/home_view_model.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StackedView<HomeViewModel> {

  const HomeView({super.key});

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    /// TODO implement responsive material menu
    /// TODO first tab contain schedule
    /// TODO second tab contain speakers
    /// TODO third tab contain favorite conferences
    /// TODO fourth tab contain profile and settings
    return const Scaffold();
  }


}