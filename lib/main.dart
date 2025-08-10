import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hireme_app/profile_bloc/profile_bloc.dart';
import 'package:hireme_app/profile_bloc/profile_observer.dart';
import 'package:hireme_app/data/data_provider/profile_data_provider.dart';
import 'package:hireme_app/data/repository/profile_data_repository.dart';
import 'package:hireme_app/presentations/screens/splash_screen.dart';
import 'package:hireme_app/theme_bloc/theme_bloc.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ProfileRepository(ProfileDataProvider()),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProfileBloc(context.read<ProfileRepository>()),
          ),
          BlocProvider(
            create: (context) => ThemeBloc()..add(SetIntitialThemeEvent()),
          ),
        ],
        child: BlocBuilder<ThemeBloc, ThemeData>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,

              theme: state,

              home: const SplashScreen(),
            );
          },
        ),
      ),
    );
  }
}
