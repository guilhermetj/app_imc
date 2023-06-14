import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:imcapp/model/imc.dart';
import 'package:imcapp/myapp.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var documentsDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(documentsDirectory.path);
  Hive.registerAdapter(ImcAdapter());
  runApp(const MyApp());
}
