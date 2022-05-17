

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import '../models/scan_model.dart';

startlaunchUrl(BuildContext context, ScanModel scan) async {
  final url = scan.valor;
  Uri myUri = Uri.parse(url);
  if(scan.tipo == 'http' ){

  if (!await launchUrl(myUri)) throw 'Could not launch $url';

   }else{
     Navigator.pushNamed(context, 'mapa', arguments: scan);

   }
}