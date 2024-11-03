import 'package:flutter/material.dart';
import 'package:notes_app/Views/view_note.dart';
import 'package:notes_app/service/sqflite.dart';

import '../Widgets/Text_fit.dart';

class EditNoteScreen extends StatelessWidget {
  EditNoteScreen(
      {super.key,
      required this.titles,
      required this.Descrebion,
      required this.id,
    });

  int id;
  String titles;
  String Descrebion;

  Sqflite sqq = Sqflite();

  @override
  Widget build(BuildContext context) {
    TextEditingController controtter = TextEditingController();
    TextEditingController controtterr = TextEditingController();

    controtter.text = titles;
    controtterr.text = Descrebion;
    return Scaffold(
        body: ListView(
      children: [
        SafeArea(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Edit the Note',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () async {
                        int responce = await sqq.updat(
                            'NOTE',
                            {
                              "title": controtter.text,
                              "Discrebtion": controtterr.text,
                            },
                            "id ='$id'");
                    
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ViewNoteScreen(
                            title: controtter.text,
                            Descrebion: controtterr.text,
                            ID: id,
                          );
                        }));
                      },
                      icon: const Icon(Icons.check))
                ],
              ),
            ),
          ),
        ),
        Column(
          children: [
            CustomTextFit(ccontroller: controtter, enntText: 'Title'),
            const SizedBox(
              height: 30,
            ),
            CustomTextFit(
              ccontroller: controtterr,
              enntText: 'Descriptions',
              mixline: 7,
            )
          ],
        )
      ],
    ));
  }
}
