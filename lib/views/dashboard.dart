import 'package:apiflutterlara/helper/databasehelper.dart';
import 'package:flutter/material.dart';

import 'adddata.dart';
import 'detailpage.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //include dbhelper
  DatabaseHelper dbHelper = DatabaseHelper();

  //create initstate
  @override
  void initState() {
    dbHelper.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddData(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: dbHelper.getData(),
        builder: ((context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ItemList(list: snapshot.data)
              : const Center(
                  child: CircularProgressIndicator(),
                );
        }),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  List list;
  ItemList({required this.list, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => DetailPage(
                    list: list,
                    index: index,
                  ),
                ),
              );
            },
            child: Card(
              child: ListTile(
                title: Text(list[index]['name']),
              ),
            ),
          ),
        );
      },
    );
  }
}
