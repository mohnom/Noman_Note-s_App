import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/Views/Edith_Note.dart';
import 'package:notes_app/Views/home_view.dart';
import 'package:notes_app/service/sqflite.dart';

class ViewNoteScreen extends StatefulWidget {
  ViewNoteScreen({
    super.key,
    required this.title,
    required this.Descrebion,
    required this.ID,
  });
  String title;
  int ID;
  String Descrebion;

  @override
  State<ViewNoteScreen> createState() => _ViewNoteScreenState();
}

class _ViewNoteScreenState extends State<ViewNoteScreen> {
  Sqflite sqq = Sqflite();
  @override
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children:[
            IconButton(
            icon: Icon(Icons.exit_to_app_rounded),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) {
                return HomeView();
              }));
            },
          ),
          ]),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return EditNoteScreen(
                    titles: widget.title,
                    Descrebion: widget.Descrebion,
                    id: widget.ID,
                  );
                }));
              },
              icon: const Icon(Icons.drive_file_rename_outline)),
        ),
        body: ListView(
          children: [
            Text(
              widget.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              widget.Descrebion,
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
