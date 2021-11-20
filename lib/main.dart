import 'package:flutter/material.dart';
import 'UI/widgets/app/model/my_app_model.dart';
import 'UI/widgets/app/my_app.dart';
bool lightTheme = true;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final model =MyAppModel();
  await model.checkAuth();//приостонавливаеся для проверки авторизации
  final  app = MyApp(model: model);
  runApp(app);
}


