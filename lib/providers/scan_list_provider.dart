

import 'package:flutter/foundation.dart';


import '../models/scan_model.dart';
import 'db_provider.dart';

class ScanListProvider extends ChangeNotifier{

  List<ScanModel> scans = [];
  
  String tipoSeleccionado = 'htpp';

  Future<ScanModel>nuevoScan(String valor)async{

    final nuevoScan = new ScanModel(valor: valor);

    final id = await DBProvider.db.nuevoScan(nuevoScan);

    nuevoScan.id = id;

    if(tipoSeleccionado==nuevoScan.tipo){
      scans.add(nuevoScan); 
      notifyListeners();
    }
  return nuevoScan;  
  
  }
  cargarScans() async {
    final scans = await DBProvider.db.getAllScan();
    this.scans = [...?scans];
    notifyListeners();
  }

 cargarScanPorTipo( String tipo ) async {
    final scans = await DBProvider.db.getScansPorTipo(tipo);
    this.scans = [...scans];
    this.tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarTodos() async {
    await DBProvider.db.deleteAll();
    this.scans = [];
    notifyListeners();
  }

  borrarScanPorId( int id ) async {
    await DBProvider.db.deleteScan(id);
  }

}