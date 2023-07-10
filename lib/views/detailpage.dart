import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  List list;
  int index;
  DetailPage({required this.list, required this.index, super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(widget.list[widget.index]['name'])),
    );
  }
}
