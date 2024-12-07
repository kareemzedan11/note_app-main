import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app/cubit/note_provider.dart';
import 'package:todo_app/app/data/hive_data_storage.dart';  
import 'app/screens/home/home_view.dart';   

final RouteObserver<Route> routeObserver = RouteObserver<PageRoute>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());

  await Hive.openBox<NoteModel>('notes');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NoteNotifier(),  
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo App',
        navigatorObservers: [routeObserver],  // Optional for route monitoring
        themeMode: ThemeMode.system,   
        home: const HomeView(),   
      ),
    );
  }
}
