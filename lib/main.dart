import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/presentation/providers/task_provider.dart';

import 'package:task_management_app/presentation/screens/home_screen.dart';

Future<void> main() async {
  await dotenv.load(fileName: "assets/.env");
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => TaskProvider())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const MyHomeScreen());
  }
}
