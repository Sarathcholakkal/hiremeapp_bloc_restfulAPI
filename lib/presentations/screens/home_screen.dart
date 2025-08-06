import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;
import 'package:hireme_app/bloc/profile_bloc.dart';
import 'package:hireme_app/presentations/screens/add_new_entry.dart';
import 'package:hireme_app/presentations/widgets/custom_app_bar.dart';
import 'package:hireme_app/presentations/widgets/custom_card.dart';
// ignore: depend_on_referenced_packages

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //!  random color generator funcitons

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => AddNewEntry()));
        },
        child: Icon(Icons.add),
      ),
      appBar: CustomAppBar(),
      // body: SizedBox(
      //   child: ListView.builder(
      //     padding: EdgeInsets.symmetric(horizontal: 16),
      //     itemCount: 10,
      //     itemBuilder: (context, index) {
      //       return CustomCard();
      //     },
      //   ),
      // ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileFauilure) {
            return Center(child: Text(state.error));
          }
          if (state is! ProfileSuccess) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          final data = state.profile;
          return Center(child: CustomCard(profileData: data));
        },
      ),
    );
  }
}
