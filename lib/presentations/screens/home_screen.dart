import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'
    show BlocBuilder, read, ReadContext;
import 'package:hireme_app/profile_bloc/profile_bloc.dart';
import 'package:hireme_app/presentations/screens/add_new_entry.dart';
import 'package:hireme_app/presentations/screens/update_entry.dart';
import 'package:hireme_app/presentations/widgets/custom_app_bar.dart';
import 'package:hireme_app/presentations/widgets/custom_card.dart';
// ignore: depend_on_referenced_packages

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<ProfileBloc>().add(ProfileFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          if (state is ProfileFauilureState) {
            return Center(child: Text(state.error));
          }
          if (state is ProfileEmptyState) {
            return const Center(
              child: Text('no data found need to add new data'),
            );
          }
          if (state is ProfileLoadingState) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          if (state is ProfileSucessState) {
            final datas = state.profile;
            return SizedBox(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: datas.length,
                itemBuilder: (context, index) {
                  final data = datas[index];

                  return CustomCard(profileData: data);
                },
              ),
            );

            // Center(
            //   child: GestureDetector(
            //     onDoubleTap: () {
            //       Navigator.of(context).push(
            //         MaterialPageRoute(
            //           builder: (context) => UpdateEntry(userprofile: data),
            //         ),
            //       );
            //     },
            //     child: CustomCard(profileData: data),
            //   ),
            // );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
