import 'package:apiflutterlara/helper/databasehelper.dart';
import 'package:apiflutterlara/views/dashboard.dart';
import 'package:flutter/material.dart';

import 'editpage.dart';

class DetailPage extends StatefulWidget {
  List list;
  int index;
  DetailPage({required this.list, required this.index, super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  DatabaseHelper dbHelper = DatabaseHelper();

  void confirm() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text("Are you sure?"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  dbHelper.deleteData(widget.list[widget.index]['id']);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => Dashboard(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: Icon(Icons.check_circle),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: Icon(Icons.cancel),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(widget.list[widget.index]['name']),
      ),
      body: Container(
        height: 200,
        child: Card(
            elevation: 5,
            margin: const EdgeInsets.fromLTRB(
              0,
              20,
              0,
              16,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Column(
                children: [
                  Text(
                    widget.list[widget.index]['name'],
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.list[widget.index]['description'],
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (BuildContext context) => EditPage(
                                  list : widget.list,
                                  index: widget.index,
                                )),
                          );
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.green,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // dbHelper.deleteData(widget.list[widget.index]['id']);
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (BuildContext context) => Dashboard(),
                          //   ),
                          // );
                          confirm();
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
