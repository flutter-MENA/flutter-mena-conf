import 'package:flutter/material.dart';
import 'package:mena_conf/ui/pages/favorites/favorites_view_model.dart';
import 'package:stacked/stacked.dart';

class FavoritesView extends StackedView<FavoritesViewModel> {

  const FavoritesView({super.key});

  @override
  FavoritesViewModel viewModelBuilder(BuildContext context) => FavoritesViewModel();

  @override
  Widget builder(BuildContext context, FavoritesViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
    );
  }


}