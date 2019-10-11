# Pelatihan Flutter

Pelatihan Flutter
Universitas Andalas
9 - 11 Oktober

- [Link Presentasi](https://drive.google.com/file/d/1bECsMloK8abtqJBmXXdsizd6gBnP5Lhk/view?usp=sharing)

## Pemateri
- [Ferry Stephanus Suwita](https://github.com/superipey)
- [Irvan Lutfi Gunawan](https://github.com/agryva)
- [Iman Nurrohman](https://github.com/imannrhman)

## Link API
### Read Data (http://flutterclass.somearch.site/mahasiswa)
Example Result
```
{
  result: [
    {
      id: 3,
      nim: "1234",
      nama: "Ferry",
      jenis_kelamin: "L",
      alamat: "Bandung",
      jurusan: "Sistem Informasi",
      created_at: "2019-10-10 07:42:30",
      updated_at: "2019-10-10 07:42:30"
    }
  ]
}
```

### [POST] Insert Data (http://flutterclass.somearch.site/mahasiswa)
Example Body
```
{
  "nim": "14012016",
  "nama": "Ferry",
  "jenis_kelamin": "L",
  "alamat": "Bandung",
  "jurusan": "Sistem Informasi"
}
```

Example Result
```
{
    "message": "Data berhasil dimasukan"
}
```

### [POST] Edit Data (http://flutterclass.somearch.site/mahasiswa/{id})
Example Body
```
{
  "nim": "14012016",
  "nama": "Ferry",
  "jenis_kelamin": "L",
  "alamat": "Bandung",
  "jurusan": "Sistem Informasi"
}
```

Example Result
```
{
    "message": "Data berhasil diubah"
}
```



### [DELETE] Delete Data (http://flutterclass.somearch.site/mahasiswa/{id})
Example Result
```
{
    "message": "Data berhasil dihapus"
}
```
