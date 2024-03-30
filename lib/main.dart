import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yours_technical_test/features/menu/bloc/menu_page_bloc.dart';
import 'package:yours_technical_test/features/menu/ui/page/menu_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late final MenuPageCubit _menuBlocCubit;

  @override
  void initState() {
    super.initState();
    _menuBlocCubit = MenuPageCubit()..init();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _menuBlocCubit),
      ],
      child: const MaterialApp(
        home: MenuPage(),
      ),
    );
  }
}
