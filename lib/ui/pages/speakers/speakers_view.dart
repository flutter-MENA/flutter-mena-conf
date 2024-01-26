

import 'package:flutter/material.dart';
import 'package:mena_conf/ui/pages/speakers/speakers_view_model.dart';
import 'package:stacked/stacked.dart';

class SpeakersView extends StackedView<SpeakersViewModel> {

  const SpeakersView({super.key});

  @override
  SpeakersViewModel viewModelBuilder(BuildContext context) => SpeakersViewModel();

  @override
  Widget builder(BuildContext context, SpeakersViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Speakers'),
      ),
    );
  }
}