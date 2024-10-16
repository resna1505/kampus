import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampus/blocs/invoice_payment/invoice_payment_bloc.dart';
import 'package:kampus/services/auth_service.dart';
import 'package:kampus/shared/shared_values.dart';
// import 'package:kampus/shared/shared_methods.dart';
import 'package:kampus/shared/theme.dart';
import 'package:kampus/ui/widgets/list_paid.dart';
import 'package:kampus/ui/widgets/list_unpaid.dart';
import 'package:http/http.dart' as http;

class InvoicePaymentPage extends StatefulWidget {
  const InvoicePaymentPage({
    super.key,
  });

  @override
  State<InvoicePaymentPage> createState() => _InvoicePaymentPageState();
}

class _InvoicePaymentPageState extends State<InvoicePaymentPage> {
  // _InvoicePaymentPageState() {
  //   _selectedVal = _productSizeList[0];
  // }

  // final _productSizeList = [
  //   'Uang Kuliah',
  //   'Wisuda',
  //   'Biaya Konversi',
  //   'perpanjang ktm',
  //   'praktek gerontik',
  //   'Uang KTM',
  // ];
  // String _selectedVal = "Uang Kuliah";

  List<Map<String, dynamic>> _productSizeList = [];
  String _selectedTahunAkademik = '';
  String _selectedTahun = '';
  String _selectedSemester = '';

  @override
  void initState() {
    super.initState();
    fetchProductSizeList();
  }

  Future<void> fetchProductSizeList() async {
    final idmhs = await AuthService().getIdMahasiswa();
    // final url = '$baseUrl/mahasiswa/tahunakademik/$idmhs';
    final response = await http.post(
      Uri.parse(
        '$baseUrl/mahasiswa/komponenbayar',
      ),
      body: {
        'id': idmhs,
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      setState(() {
        _productSizeList = List.from(data).cast<Map<String, dynamic>>();

        if (_productSizeList.isNotEmpty) {
          _selectedTahunAkademik = _productSizeList[0]['NAMAKOMPONEN'];
          _selectedTahun = _productSizeList[0]['TAHUNAJARAN'];
          _selectedSemester = _productSizeList[0]['SEMESTER'];
        }
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          elevation: 0.5,
          title: Text(
            'Invoice Payment',
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: semiBold,
            ),
          ),
          bottom: TabBar(
            labelColor: purpleColor,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 9),
                child: const Text(
                  'Unpaid',
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 9),
                child: const Text(
                  'Payment History',
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BlocProvider(
              create: (context) =>
                  InvoicePaymentBloc()..add(InvoicePaymentGet()),
              child: BlocBuilder<InvoicePaymentBloc, InvoicePaymentState>(
                builder: (context, state) {
                  if (state is InvoicePaymentSuccess) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 24),
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                            color: whiteColor,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 4.0,
                                offset: Offset(0, -4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: state.invoicePayment
                                .where((invoicePaymentMethod) =>
                                    invoicePaymentMethod.id == '3' ||
                                    invoicePaymentMethod.id == '5')
                                .map((invoicePaymentMethod) {
                              return ListUnpaid(
                                  invoicePaymentMethod: invoicePaymentMethod);
                            }).toList(),
                            // children: [
                            //   ListUnpaid(
                            //     komponen: '1. Uang Kuliah',
                            //     biaya: formatCurrency(1000000),
                            //     tanggal: '1 Jan 2024',
                            //   ),
                            // ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                            color: whiteColor,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 4.0,
                                offset: Offset(0, -2),
                              ),
                            ],
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: greySoftColor),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total Billing',
                                      style: greyDarkTextStyle.copyWith(
                                        fontSize: 12,
                                        fontWeight: regular,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  state.invoicePayment.first.id.toString(),
                                  style: redTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: semiBold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            BlocProvider(
              create: (context) =>
                  InvoicePaymentBloc()..add(InvoicePaymentGet()),
              child: BlocBuilder<InvoicePaymentBloc, InvoicePaymentState>(
                builder: (context, state) {
                  if (state is InvoicePaymentSuccess) {
                    return Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // DropdownButtonFormField(
                        //   padding: const EdgeInsets.symmetric(
                        //     horizontal: 12,
                        //   ),
                        //   value: _selectedVal,
                        //   items: _productSizeList
                        //       .map(
                        //         (e) => DropdownMenuItem(
                        //           child: Text(e),
                        //           value: e,
                        //         ),
                        //       )
                        //       .toList(),
                        //   onChanged: (val) {
                        //     setState(
                        //       () {
                        //         _selectedVal = val as String;
                        //       },
                        //     );
                        //   },
                        //   icon: Icon(
                        //     Icons.arrow_drop_down_circle,
                        //     color: purpleColor,
                        //   ),
                        //   // dropdownColor: Colors.blue.shade50,
                        //   decoration: const InputDecoration(
                        //     labelText: 'Pilih Komponen',
                        //     border: InputBorder.none,
                        //   ),
                        // ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          child: DropdownButtonFormField<String>(
                            value: _selectedTahunAkademik.isNotEmpty
                                ? _selectedTahunAkademik
                                : null,
                            items: _productSizeList.map((e) {
                              return DropdownMenuItem<String>(
                                value: e['NAMAKOMPONEN'],
                                child: Text(e['NAMAKOMPONEN']),
                              );
                            }).toList(),
                            onChanged: (val) {
                              setState(() {
                                _selectedTahunAkademik = val ?? '';
                                _selectedTahun = _productSizeList.firstWhere(
                                        (e) => e['NAMAKOMPONEN'] == val)[
                                    'TAHUNAJARAN'];
                                _selectedSemester = _productSizeList.firstWhere(
                                    (e) =>
                                        e['NAMAKOMPONEN'] == val)['SEMESTER'];
                              });
                            },
                            icon: Icon(
                              Icons.arrow_drop_down_circle,
                              color: purpleColor,
                            ),
                            decoration: const InputDecoration(
                              labelText: 'Pilih Tahun Akademik',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 12),
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                            color: whiteColor,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 4.0,
                                offset: Offset(0, -4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: state.invoicePayment
                                // .where((invoicePaymentMethod) =>
                                //     invoicePaymentMethod.id == '10')
                                .map((invoicePaymentMethod) {
                              return ListPaid(
                                  invoicePaymentMethod: invoicePaymentMethod);
                            }).toList(),
                            // children: [
                            //   ListPaid(
                            //     komponen: '1. Uang Kuliah',
                            //     biaya: formatCurrency(1000000),
                            //     tanggal: '1 Jan 2024',
                            //   ),
                            //   ListPaid(
                            //     komponen: '2. Uang Kuliah',
                            //     biaya: formatCurrency(1000000),
                            //     tanggal: '1 Feb 2024',
                            //   ),
                            //   ListPaid(
                            //     komponen: '3. Uang Kuliah',
                            //     biaya: formatCurrency(1000000),
                            //     tanggal: '1 Mar 2024',
                            //   ),
                            //   ListPaid(
                            //     komponen: '4. Uang Kuliah',
                            //     biaya: formatCurrency(1000000),
                            //     tanggal: '1 Apr 2024',
                            //   ),
                            // ],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                            color: whiteColor,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 4.0,
                                offset: Offset(0, -2),
                              ),
                            ],
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: greySoftColor),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Sisa Pembayaran',
                                      style: greyDarkTextStyle.copyWith(
                                        fontSize: 12,
                                        fontWeight: regular,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  // formatCurrency(4000000),
                                  state.invoicePayment.first.id.toString(),
                                  style: redTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: semiBold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
