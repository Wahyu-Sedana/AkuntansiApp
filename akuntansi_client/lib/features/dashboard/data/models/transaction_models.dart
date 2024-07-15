class TransactionResponseModel {
  String? message;
  int? totalPemasukan;
  int? totalPengeluaran;
  int? totalSaldo;
  bool? status;
  List<TransactionModel> transactionModel;

  TransactionResponseModel({
    required this.message,
    required this.totalPemasukan,
    required this.totalPengeluaran,
    required this.totalSaldo,
    required this.status,
    required this.transactionModel,
  });

  factory TransactionResponseModel.fromJson(Map<String, dynamic> json) => TransactionResponseModel(
        message: json['message'],
        totalPemasukan: json['totalPemasukan'],
        totalPengeluaran: json['totalPengeluaran'],
        totalSaldo: json['totalSaldo'],
        status: json['status'],
        transactionModel:
            List<TransactionModel>.from(json['data'].map((x) => TransactionModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'totalPemasukan': totalPemasukan,
        'totalPengeluaran': totalPengeluaran,
        'totalSaldo': totalSaldo,
        'status': status,
        'data': List<dynamic>.from(transactionModel.map((x) => x.toJson())),
      };
}

class TransactionModel {
  int? idJenis;
  int? idTransaksi;
  String? kategori;
  int? jumlah;
  String? catatan;
  String? tanggal;

  TransactionModel({
    this.idJenis,
    this.idTransaksi,
    required this.catatan,
    required this.kategori,
    required this.jumlah,
    required this.tanggal,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
        idJenis: json['id_jenis'],
        idTransaksi: json['id_transaksi'],
        catatan: json['catatan'],
        kategori: json['kategori'],
        jumlah: json['jumlah'],
        tanggal: json['tanggal'],
      );

  Map<String, dynamic> toJson() => {
        'id_jenis': idJenis,
        'id_transaksi': idTransaksi,
        'catatan': catatan,
        'kategori': kategori,
        'jumlah': jumlah,
        'tanggal': tanggal,
      };
}
