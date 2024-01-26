import 'package:flutter/material.dart';
import 'package:mena_conf/ui/pages/favorites/favorites_view.dart';
import 'package:mena_conf/ui/pages/home/home_view_model.dart';
import 'package:mena_conf/ui/pages/profile/profile_view.dart';
import 'package:mena_conf/ui/pages/schedule/schedule_view.dart';
import 'package:mena_conf/ui/pages/speakers/speakers_view.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StackedView<HomeViewModel> {

  const HomeView({super.key});

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();


  final List<Widget> _listWidget = const <Widget>[
    ScheduleView(),
    SpeakersView(),
    FavoritesView(),
    ProfileView()
  ];

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    /// TODO implement responsive material menu
    /// TODO first tab contain schedule
    /// TODO second tab contain speakers
    /// TODO third tab contain favorite conferences
    /// TODO fourth tab contain profile and settings
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
           BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Speakers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          )
        ],
        currentIndex: viewModel.currentIndex,
        onTap: (int index) => viewModel.changeTab(index),
      ),
      body: _listWidget[viewModel.currentIndex],
    );
  }


}