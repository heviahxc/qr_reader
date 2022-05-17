import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/ui_provider.dart';

class CustomNavigatorBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
     final uiProvider = Provider.of<UiProvider>(context);
    final optionSelect = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
      onTap: (int i) => uiProvider.selectedMenuOpt = i,
      currentIndex: optionSelect,
      elevation: 0,
      items: const <BottomNavigationBarItem> [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Mapa'
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.compass_calibration),
          label: 'Direcciones'
          ),
      ],
      
    );
  }
}