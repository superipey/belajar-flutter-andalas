class Mahasiswa {
  final String nim;
  final String nama;
  final String jenisKelamin;

  Mahasiswa(this.nim, this.nama, this.jenisKelamin);

  String get jenisKelaminLabel {
    if (jenisKelamin == 'L') return 'Laki-Laki';
    if (jenisKelamin == 'P') return 'Perempuan';
  }
}