class InvoicePaymentModel {
  final String? komponen;
  final int? biaya;
  final String? tanggal;
  final String? name;
  final String? id;

  InvoicePaymentModel({
    this.komponen,
    this.biaya,
    this.tanggal,
    this.name,
    this.id,
  });

  factory InvoicePaymentModel.fromJson(Map<String, dynamic> json) =>
      InvoicePaymentModel(
        komponen: json['NAMAKOMPONEN'],
        biaya: json['JUMLAH'],
        tanggal: json['TANGGALBAYAR'],
        name: json['name'],
        id: json['id'],
      );
}
