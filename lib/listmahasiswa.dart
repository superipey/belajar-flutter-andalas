import 'dart:convert';

import 'package:belajar_flutter_andalas/model/Mahasiswa.dart';
import 'package:belajar_flutter_andalas/service/ApiService.dart';
import 'package:flutter/material.dart';

class ListMahasiswa extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListMahasiswaState();
  }
}


class ListMahasiswaState extends State<ListMahasiswa> {

  ApiService apiService = ApiService();
  List<Mahasiswa> list = List();

  @override
  void initState() {
    apiService.getDataMahasiswa().then((result) => {
      setState(() => {
        list = (json.decode(result.body)["result"] as List)
        .map((data) => new Mahasiswa.fromJson(data))
        .toList()
      })

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "List Mahasiswa",
      home: Scaffold(
        appBar: AppBar(
          title: Text("List Mahasiswa"),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.pop(context);
              },
            ),

        ),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.all(8),
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          title: Text(list[index].nama),
                          subtitle: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text("Jenis kelamin : "),
                                  Text(list[index].jenisKelamin)
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text("Jurusan : "),
                                  Text(list[index].jurusan)
                                ],
                              )
                            ],
                          ),

                        )

                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

}