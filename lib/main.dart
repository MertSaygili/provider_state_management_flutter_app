import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'feature/constants/strings.dart';
import 'product/providers/counter_provider.dart';
import 'product/providers/fetch_data_provider.dart';
import 'product/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider()),
        ChangeNotifierProvider(create: (context) => FetchDataProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: Strings.appTitle, theme: ThemeData.dark(), home: const HomeScreen());
  }
}
