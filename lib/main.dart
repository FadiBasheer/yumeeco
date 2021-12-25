import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yumeeco_test/authenticate/register.dart';
import 'payment/payment.dart';
import 'package:yumeeco_test/time_picker/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'authenticate/sign_in.dart';
import 'cart/cart_provider.dart';
import 'home.dart';
import 'location_time_widget.dart';
import 'task_data.dart';
import 'view/first_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<TaskData>(
        create: (context) => TaskData(),
      ),
      ChangeNotifierProvider<CartProvider>(
        create: (context) => CartProvider(),
      ),

      ChangeNotifierProvider<TimeProvider>(
        create: (context) => TimeProvider(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  List countries;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: Home(),

      // another way using routes
      initialRoute: FirstView.id,
      routes: {
        FirstView.id: (context) => FirstView(),
        Register.id: (context) => Register(),
        SignIn.id: (context) => SignIn(),
        Home.id: (context) => Home(),
        LocationAndTimeWidget.id: (context) => LocationAndTimeWidget(),
        pay.id: (context) => pay(),
      },
    );
  }
}
