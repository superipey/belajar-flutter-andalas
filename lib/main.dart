import 'package:belajar_flutter_andalas/listmahasiswa.dart';
import 'package:belajar_flutter_andalas/model/Mahasiswa.dart';
import 'package:belajar_flutter_andalas/service/ApiService.dart';
import 'package:belajar_flutter_andalas/splahscreen.dart';
import 'package:flutter/material.dart';
import 'package:belajar_flutter_andalas/submit.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: SplashScreen(),
    );
  }
}

class MainAplikasi extends StatefulWidget {
  @override
  _MainAplikasi createState() => _MainAplikasi();
}

class _MainAplikasi extends State {
  List<DropdownMenuItem<String>> listJenisKelamin = [
    DropdownMenuItem(value: 'L', child: Text('Laki-Laki')),
    DropdownMenuItem(value: 'P', child: Text('Perempuan')),
  ];

  List<DropdownMenuItem<String>> listJurusan = [
    DropdownMenuItem(
        value: 'Sistem Informasi', child: Text('Sistem Informasi')),
    DropdownMenuItem(
        value: 'Teknik Informatika', child: Text('Teknik Informatika')),
    DropdownMenuItem(value: 'Akuntansi', child: Text('Akuntansi')),
    DropdownMenuItem(value: 'Teknik ELektro', child: Text('Teknik ELektro')),
  ];

  final txtNim = TextEditingController();
  final txtNama = TextEditingController();
  final txtAlamat = TextEditingController();

  String txtJenisKelamin = 'L';
  String txtJurusan = 'Sistem Informasi';

  bool _txtNimValid = true;

  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      key: _scaffoldState,
      appBar: AppBar(title: Text("Aplikasiku")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Text('Form Pendaftaran',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('NIM'),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        controller: txtNim,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          bool isFieldValid = value.trim().isNotEmpty;
                          if (isFieldValid != _txtNimValid) {
                            setState(() => _txtNimValid = isFieldValid);
                          }
                        },
                        decoration: InputDecoration(
                            errorText: _txtNimValid ? null : 'NIM harus diisi',
                            border: InputBorder.none,
                            hintText: 'Input NIM'),
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
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
                      flex: 2,
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
                        value: txtJenisKelamin,
                        items: listJenisKelamin.toList(),
                        onChanged: (String newVal) {
                          setState(() {
                            txtJenisKelamin = newVal;
                          });
                        },
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Alamat'),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        controller: txtAlamat,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Input Alamat'),
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Jurusan'),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: DropdownButton<String>(
                        hint: Text('Jenis Kelamin'),
                        iconSize: 24,
                        value: txtJurusan,
                        items: listJurusan.toList(),
                        onChanged: (String newVal) {
                          setState(() {
                            txtJurusan = newVal;
                          });
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
                        Mahasiswa m = Mahasiswa(txtNim.text, txtNama.text,
                            txtJenisKelamin, txtAlamat.text, txtJurusan);
                        print(m.nama);
                        print(m.nim);

                        if (_txtNimValid) {
                          apiService.insertMahasiswa(m).then((result) => {
                            if (result.statusCode == 200) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => submit(m)))
                            } else {
                              _scaffoldState.currentState.showSnackBar(SnackBar(
                                  content: Text("Data gagal dimasukan")))
                            }
                          });

                        } else {
                          _scaffoldState.currentState.showSnackBar(SnackBar(
                              content: Text("Mohon isi form dengan lengkap")));
                        }
                      },
                    ),Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: RaisedButton(
                        onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context)=>ListMahasiswa()));
                        },
                        child: Text("List Mahasiswa"),
                      ),
                    )
//                    RaisedButton(
//                      child: Text('Test'),
//                      onPressed: () {
//                        Navigator.push(context,  MaterialPageRoute(
//                            builder: (context) => ListMahasiswa()));
//                      },
//                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
