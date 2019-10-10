import 'package:belajar_flutter_andalas/model/Mahasiswa.dart';
import 'package:flutter/material.dart';
import 'package:belajar_flutter_andalas/submit.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: MainAplikasi(),
    );
  }
}

class MainAplikasi extends StatefulWidget {
  @override
  _MainAplikasi createState() => _MainAplikasi();
}

class _MainAplikasi extends State {
  List<DropdownMenuItem<String>> listJenisKelamin = [
    DropdownMenuItem(value: 'Laki-Laki', child: Text('Laki-Laki')),
    DropdownMenuItem(value: 'Perempuan', child: Text('Perempuan')),
  ];

  final txtNim = TextEditingController();
  final txtNama = TextEditingController();

  String txtJenisKelamin = 'Laki-Laki';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(title: Text("Aplikasiku")),
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Text('Form Pendaftaran',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
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
                    child: TextField(
                      controller: txtNim,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Input NIM'),
                    ),
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
                    child: TextField(
                      controller: txtNama,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Input Nama'),
                    ),
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
                    child: DropdownButton<String>(
                      hint: Text('Jenis Kelamin'),
                      iconSize: 24,
                      items: listJenisKelamin.toList(),
                      onChanged: (String newVal) {
                      },
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  RaisedButton(
                    child: Text('Kirim'),
                    onPressed: () {
                      Mahasiswa m = Mahasiswa(txtNim.text, txtNama.text, txtJenisKelamin);
                      print(m.nama);
                      print(m.nim);

//                      Navigator.push(context,
//                          MaterialPageRoute(builder: (context) => submit(m)));


                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
