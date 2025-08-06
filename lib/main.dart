import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hireme_app/bloc/profile_bloc.dart';
import 'package:hireme_app/data/data_provider/profile_data_provider.dart';
import 'package:hireme_app/data/repository/profile_data_repository.dart';
import 'package:hireme_app/presentations/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ProfileRepository(ProfileDataProvider()),
      child: BlocProvider(
        create: (context) => ProfileBloc(context.read<ProfileRepository>()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          color: Colors.white,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(color: Colors.white),
          ),

          home: const SplashScreen(),
        ),
      ),
    );
  }
}
