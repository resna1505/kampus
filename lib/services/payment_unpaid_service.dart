import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kampus/models/payment_unpaid_model.dart';
import 'package:kampus/services/auth_service.dart';
import 'package:kampus/shared/shared_values.dart';

class PaymentUnpaidService {
  Future<List<PaymentUnpaidModel>> getPay() async {
    try {
      final idmhs = await AuthService().getIdMahasiswa();
      final res = await http.get(
        Uri.parse(
          '$baseUrl/mahasiswa/tagihan/$idmhs',
        ),
      );

      if (res.statusCode == 200) {
        return List<PaymentUnpaidModel>.from(jsonDecode(res.body).map(
                (paymentunpaid) => PaymentUnpaidModel.fromJson(paymentunpaid)))
            .toList();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
