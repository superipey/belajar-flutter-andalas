class Mahasiswa {
  final String nim;
  final String nama;
  final String jenisKelamin;
  final String alamat;
  final String jurusan;

  Mahasiswa(this.nim, this.nama, this.jenisKelamin, this.alamat, this.jurusan);

  String get jenisKelaminLabel {
    if (jenisKelamin == 'L') return 'Laki-Laki';
    if (jenisKelamin == 'P') return 'Perempuan';
  }

  factory Mahasiswa.fromJson(Map<String, dynamic> json) {
    return Mahasiswa(
      json['nim'],
      json['nama'],
      json['jenis_kelamin'],
      json['alamat'],
      json['jurusan']
    );
  }
}