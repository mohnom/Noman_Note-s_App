import 'package:flutter/material.dart';
import 'package:notes_app/Views/home_view.dart';
import 'package:notes_app/Widgets/Text_fit.dart';

import '../service/sqflite.dart';

class Showmodelsheet extends StatelessWidget {
  const Showmodelsheet({super.key});

  @override
  Widget build(BuildContext context) {
    int i = 0;
    final List<Colors> colorss = [];

    Sqflite sqq = Sqflite();
    GlobalKey<FormState> formstate = GlobalKey();
    TextEditingController title = TextEditingController();
    TextEditingController descriotion = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            CustomTextFit(
              enntText: 'Title',
              ccontroller: title,
            ),
            const SizedBox(
              height: 25,
            ),
            CustomTextFit(
              enntText: 'Descriptions',
              mixline: 5,
              ccontroller: descriotion,
            ),
            const SizedBox(
              height: 56,
            ),
            GestureDetector(
              onTap: () async {
         
                DateTime date = DateTime.now();

                String dateString = date.toString().split(' ')[0];
                int responce = await sqq.insert('NOTE', {
                  "title": title.text,
                  "Discrebtion": descriotion.text,
                  "DATE": dateString.toString() ?? "Error",

                });

                if (i < colorss.length) {
                  i++;
                } else {
                  i = 0;
                }
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HomeView(),
                  ),
                );
              },
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 31, 197, 209),
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(
                  child: Text(
                    'ADD',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 24),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
