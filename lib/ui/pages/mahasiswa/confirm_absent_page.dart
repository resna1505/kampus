import 'package:flutter/material.dart';
import 'package:kampus/shared/theme.dart';
import 'package:kampus/ui/widgets/buttons.dart';

class ConfirmAbsentPage extends StatelessWidget {
  const ConfirmAbsentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final String? scanResult = arguments?['scanResult'];
    final String? idmakul = arguments?['idmakul'];

    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        automaticallyImplyLeading: false,
        title: Text(
          'Confirm Absent',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 24,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: whiteColor,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 4.0,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$scanResult',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  '$idmakul',
                  style: greyDarkTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomFilledButton(
                  title: 'Confirm',
                  width: double.infinity,
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/home-page-mahasiswa', (route) => false);
                  },
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    SizedBox(
                      child: Icon(
                        Icons.info_rounded,
                        color: greyDarkColor,
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      'Ruangan Praktikum ',
                      style: greyDarkTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: regular,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
