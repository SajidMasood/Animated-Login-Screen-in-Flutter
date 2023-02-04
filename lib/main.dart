import 'package:flutter/material.dart';
import 'package:animated_login_flutter/ui/views/home_view.dart';
import 'package:provider/provider.dart';

import 'core/viewmodels/home_model.dart';
void main() =>runApp(MyApp());

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}

