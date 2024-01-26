import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {

  /// The index of the current tab.
  int _currentIndex = 0;

  /// The index of the current tab getter.
  int get currentIndex => _currentIndex;


  void changeTab(int index) {
    _currentIndex = index;
    notifyListeners();
  }

}