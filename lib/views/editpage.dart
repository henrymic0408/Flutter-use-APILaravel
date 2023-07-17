import 'package:apiflutterlara/helper/databasehelper.dart';
import 'package:apiflutterlara/views/detailpage.dart';
import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  List list;
  int index;
  EditPage({required this.list, required this.index, super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  DatabaseHelper DBhelper = DatabaseHelper();

  TextEditingController txtName = TextEditingController();
  TextEditingController txtDescription = TextEditingController();

  void initState() {
    txtName.text = widget.list[widget.index]['name'];
    txtDescription.text = widget.list[widget.index]['description'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(widget.list[widget.index]['name']),
        ),
        body: Container(
          child: ListView(
            padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
            children: [
              Container(
                height: 50,
                child: TextField(
                  controller: txtName,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: 'Input Name',
                      icon: const Icon(Icons.table_view),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                child: TextField(
                  controller: txtDescription,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Description',
                      hintText: 'Input Description',
                      icon: const Icon(Icons.table_view),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
              ),
              Container(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    //if empty value
                    if (txtName.text.isEmpty || txtDescription.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please fill all field'),
                        ),
                      );
                    } else {
                      DBhelper.updateData(widget.list[widget.index]['id'],
                      txtName.text.trim(),
                      txtDescription.text.trim(),
                      );
                      Navigator.of(context).pop();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('Update Data'),
                ),
              )
            ],
          ),
        ));
  }
}
