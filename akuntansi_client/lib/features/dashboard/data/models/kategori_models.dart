class KategoriResponseModel {
  String? message;
  bool? success;
  List<Kategori> data;

  KategoriResponseModel({required this.message, required this.success, required this.data});

  factory KategoriResponseModel.fromJson(Map<String, dynamic> json) {
    return KategoriResponseModel(
      message: json['message'],
      success: json['success'],
      data: (json['data'] as List).map((item) => Kategori.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'success': success,
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}

class Kategori {
  int? idKategori;
  int? idJenis;
  String? namaKategori;

  Kategori({required this.idKategori, required this.idJenis, required this.namaKategori});

  factory Kategori.fromJson(Map<String, dynamic> json) {
    return Kategori(
      idKategori: json['id_kategori'],
      idJenis: json['id_jenis'],
      namaKategori: json['kategori'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_kategori': idKategori,
      'id_jenis': idJenis,
      'kategori': namaKategori,
    };
  }
}
