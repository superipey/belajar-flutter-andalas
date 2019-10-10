import 'package:belajar_flutter_andalas/model/Mahasiswa.dart';
import 'package:http/http.dart';

class ApiService {
  final String baseUrl = "http://flutterclass.somearch.site";
  Client client = Client();

  Future<Response> insertMahasiswa(Mahasiswa data) async {
    final response = await client.post(
      "$baseUrl/mahasiswa",
      body: {
        "nim": data.nim,
        "nama": data.nama,
        "jenis_kelamin": data.jenisKelamin,
        "alamat": data.alamat,
        "jurusan": data.jurusan,
      },
    );
    return response;
  }

  Future<Response> getDataMahasiswa() async {
    final response = await client.get("$baseUrl/mahasiswa");

    return response ?? null;
  }
}
