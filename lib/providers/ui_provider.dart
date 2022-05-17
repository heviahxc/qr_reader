
import 'package:flutter/foundation.dart';

class UiProvider extends ChangeNotifier{

  int _selectedMenuOpt = 0;

    int get selectedMenuOpt{
      return _selectedMenuOpt;
    }

    set selectedMenuOpt( int i  ){
      _selectedMenuOpt = i;
      notifyListeners();
    }


}