import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kampus/models/invoice_payment_model.dart';

class InvoicePaymentService {
  Future<List<InvoicePaymentModel>> getInvoicePayment() async {
    try {
      final res = await http.post(
        Uri.parse(
          'https://ams-api.univbatam.ac.id/index.php/mahasiswa/riwayatbayar',
        ),
        body: {
          "id": "61123052",
          "idkomponen": "032",
          "jeniskomponen": "3",
          "tahunajaran": "2024",
          "semester": "1"
        },
      );

      if (res.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(res.body);
        final detail = jsonData[0]['detail'] as List<dynamic>;
        return detail.map((krs) => InvoicePaymentModel.fromJson(krs)).toList();
        // return List<InvoicePaymentModel>.from(jsonDecode(res.body)
        //     .map((krs) => InvoicePaymentModel.fromJson(krs))).toList();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
