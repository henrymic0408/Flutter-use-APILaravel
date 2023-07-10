import 'package:apiflutterlara/helper/databasehelper.dart';
import 'package:apiflutterlara/views/dashboard.dart';
import 'package:flutter/material.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  //dbhelper
  DatabaseHelper dbHelper = DatabaseHelper();

  TextEditingController txtName = TextEditingController();
  TextEditingController txtDesc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Data'),
      ),
      body: Container(
        child: ListView(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
            right: 10,
            left: 10,
          ),
          children: [
            Container(
              height: 50,
              child: TextField(
                controller: txtName,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Input Nama Kategori',
                    icon: const Icon(Icons.category),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              child: TextField(
                controller: txtDesc,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: 'Deskripsi',
                    hintText: 'Isi Deskripsi Kategori',
                    icon: const Icon(Icons.category),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Container(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                onPressed: () {
                  if (txtName.text.trim().isEmpty ||
                      txtDesc.text.trim().isEmpty) {
                    const snackBar = SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        'Please Fill all field',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    dbHelper.addData(txtName.text.trim(), txtDesc.text.trim());
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Dashboard(),
                    ));
                  }
                },
                child: const Text('Add Data'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
