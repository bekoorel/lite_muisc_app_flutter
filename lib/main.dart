import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_app/consetns/get_it.dart';
import 'package:music_app/screens/player_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      // Initialize ScreenUtil

      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        ScreenUtil.init(
          context,
          designSize: const Size(360, 690),
        );
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: PlayerScreen(),
        );
      },
    );
  }
}
