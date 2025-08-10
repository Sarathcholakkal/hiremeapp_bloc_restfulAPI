import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hireme_app/theme_bloc/theme_bloc.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Image.asset(
        'assets/hireme_logo.png',
        width: 10,
        fit: BoxFit.cover,
      ),
      title: const Text(
        'Hire Me',
        style: TextStyle(
          color: Colors.blueAccent,
          fontWeight: FontWeight.bold,
          fontSize: 27,
        ),
      ),
      centerTitle: true,
      actions: [
        BlocBuilder<ThemeBloc, ThemeData>(
          builder: (context, state) {
            return CupertinoSwitch(
              value: state == ThemeData.dark(),
              onChanged: (bool val) {
                context.read<ThemeBloc>().add(ToggleThemeEvent());
              },
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // Or 0 if you want
}
