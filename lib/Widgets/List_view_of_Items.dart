import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/Views/view_note.dart';
import 'package:notes_app/service/sqflite.dart';


class ListViewOfItems extends StatefulWidget {
  const ListViewOfItems({super.key});

  @override
  State<ListViewOfItems> createState() => _ListViewOfItemsState();
}

class _ListViewOfItemsState extends State<ListViewOfItems> {
    void addNote() {
    setState(() {

    });
  }
  Sqflite sqq = Sqflite();
  List notes = [];
    final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
  ];

  Future readData() async {
    List<Map> responce = await sqq.readData("SELECT * FROM 'NOTE'");
    notes.addAll(responce);

    setState(() {});
  }

  @override
  void initState() {
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: Builder(builder: (context) {
        if (notes.isNotEmpty) {
          return ListView.builder(
            itemBuilder: (context, index) {
              if (notes.isNotEmpty) {
                return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: GestureDetector(
                      onTap: () {
                       
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ViewNoteScreen(
                          
                            title: notes[index]["title"],
                            Descrebion: notes[index]["Discrebtion"],
                            ID: notes[index]['id'],
                          );
                        }));
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: colors[index % colors.length],
                              borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25, bottom: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                ListTile(
                                  title: Text(
                                    '${notes[index]["title"]}',
                                    style: const TextStyle(
                                        fontSize: 26,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  trailing: IconButton(
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.black,
                                      ),
                                      onPressed: () async {
                                        int respnce = await sqq.DeleteData(
                                            "DELETE FROM 'NOTE' WHERE id=${notes[index]['id']}");
                                        if (respnce > 0) {
                                          notes.removeWhere((element) =>
                                              element['id'] ==
                                              notes[index]["id"]);
                                          setState(() {});
                                        }
                                      }),
                                  subtitle: Text(
                                    '${notes[index]["Discrebtion"]}',
                                    style: TextStyle(
                                        color: Colors.black.withAlpha(120),
                                        fontSize: 17,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 18),
                                  child: Text(
                                    '${notes[index]["DATE"]}',
                                    style: TextStyle(
                                        color: Colors.black.withAlpha(100)),
                                  ),
                                )
                              ],
                            ),
                          )),
                    ));
              } else {
                return const Center(
                  child: Text("NO Notes"),
                );
              }
            },
            itemCount: notes.length,
          );
        } else {
          return const Center(
            child: Text("No Notes ,Plaes Add New Note"),
          );
        }
      }),
    );
  }
}
