import 'package:flutter/material.dart';

import '../Widgets/Custom_home_appbar.dart';
import '../Widgets/showModelSheet.dart';
import '../Widgets/title_notes_widget.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return const FractionallySizedBox(
                    heightFactor: 0.9, child: Showmodelsheet());
              });
         
        },
        child: const Icon(Icons.add),
      ),
      body: const Padding(
        padding: EdgeInsets.only(right: 10, left: 10),
        child: Column(
          children: [
            CustomHomeAppbar(),
            SizedBox(
              height: 20,
            ),
            TiteNotesWidget(),
            Center(child:  Text("No Notes"),)
          ],
        ),
      ),
    );
  }
}