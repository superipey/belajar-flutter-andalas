import 'package:flutter/material.dart';
import 'package:belajar_flutter_andalas/model/Mahasiswa.dart';

class submit extends StatelessWidget {
  Mahasiswa mahasiswa;

  submit(this.mahasiswa);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Aplikasiku")),
        body: SafeArea(
          child: Container(
            child: Column(
              children: <Widget>[
                Text('Submit Form',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('NIM'),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(mahasiswa.nim),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Nama'),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(mahasiswa.nama),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Jenis Kelamin'),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(mahasiswa.jenisKelaminLabel),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
