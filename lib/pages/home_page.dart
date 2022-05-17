import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/scan_list_provider.dart';
import '../providers/ui_provider.dart';
import '../widgets/custom_navigatorbar.dart';
import '../widgets/scan_button.dart';
import 'direcciones_page.dart';
import 'historial_mapas_page.dart';


class HomePage extends StatelessWidget {
   
  
  
  @override
  Widget build(BuildContext context) {

    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Historial'),
        actions: [
          IconButton(
          icon: Icon(Icons.delete_forever),
          onPressed: (){

        scanListProvider.borrarTodos();

          }
           )
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigatorBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody  extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    //obtner optionSelect
    final uiProvider = Provider.of<UiProvider>(context);
   

   final optionSelect = uiProvider.selectedMenuOpt;


    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);

   switch ( optionSelect ){

    case 0:
      scanListProvider.cargarScanPorTipo('geo');
        return HistorialMapasPage();

    case 1: 
      scanListProvider.cargarScanPorTipo('http');
        return DireccionesPage();

    default:
      return HistorialMapasPage();

   }
  }
}