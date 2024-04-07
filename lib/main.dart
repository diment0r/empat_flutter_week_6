import 'package:empat_flutter_week_6/screens/product_details_screen.dart';
import 'package:empat_flutter_week_6/state/cart_model.dart';
import 'package:empat_flutter_week_6/state/favourites_model.dart';
import 'package:empat_flutter_week_6/state/product_list_model.dart';
import 'package:empat_flutter_week_6/state/user_model.dart';
import 'package:empat_flutter_week_6/widgets/navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => FavoutritesModel()),
      ChangeNotifierProvider(create: (context) => ProductListModel()),
      ChangeNotifierProvider(create: (context) => UserModel()),
      ChangeNotifierProvider(create: (context) => CartModel()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/product-details': (context) => const ProductDetailsScreenWidget(),
      },
      home: const NavigationWidget(),
    );
  }
}
