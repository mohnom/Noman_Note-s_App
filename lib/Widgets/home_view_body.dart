import 'package:flutter/material.dart';
import 'package:notes_app/Widgets/List_view_of_Items.dart';
import 'package:notes_app/Widgets/showModelSheet.dart';
import 'package:notes_app/Widgets/title_notes_widget.dart';

import 'Custom_home_appbar.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 31, 197, 209),
        onPressed: () {
          showModalBottomSheet(
            
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return const FractionallySizedBox(
                    heightFactor: 0.9, child: Showmodelsheet());
              });
                       setState(() {
                  
                });
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: Column(
          children: [
            const CustomHomeAppbar(),
            const SizedBox(
              height: 20,
            ),
            const TiteNotesWidget(),
            Expanded(child: ListViewOfItems())
          ],
        ),
      ),
    );
  }
}
