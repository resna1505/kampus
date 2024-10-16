import 'package:flutter/material.dart';
import 'package:kampus/models/nilai_model.dart';
import 'package:kampus/shared/theme.dart';

class ListNilai extends StatelessWidget {
  final NilaiModel nilaiMethod;

  const ListNilai({
    super.key,
    required this.nilaiMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: greySoftColor,
            width: 1.0,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 11,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: purpleColor,
                ),
                child: Text(
                  nilaiMethod.idmakul.toString(),
                  style: whiteTextStyle.copyWith(
                    fontWeight: light,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(
                  ': ${nilaiMethod.sksmakul} SKS',
                  style: blackTextStyle.copyWith(fontSize: 12),
                  overflow: TextOverflow.visible,
                ),
              )
            ],
          ),
          Text(
            nilaiMethod.namamakul.toString(),
            style: blackTextStyle.copyWith(fontSize: 14),
          ),
          Row(
            children: [
              SizedBox(
                width: 90,
                child: Text(
                  'Final Score ',
                  style: blackTextStyle.copyWith(fontSize: 14),
                ),
              ),
              Text(
                ': ${nilaiMethod.nilai}',
                style: blackTextStyle.copyWith(fontSize: 14),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 90,
                child: Text(
                  'Grade ',
                  style: blackTextStyle.copyWith(fontSize: 14),
                ),
              ),
              Expanded(
                child: Text(
                  ': ${nilaiMethod.simbol}',
                  style: blackTextStyle.copyWith(fontSize: 14),
                  overflow: TextOverflow.visible,
                ),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  'TUGAS INDIVIDU ',
                  style: blackTextStyle.copyWith(fontSize: 12),
                ),
              ),
              Expanded(
                child: Text(
                  ': ${nilaiMethod.name ?? '-'}',
                  style: blackTextStyle.copyWith(fontSize: 12),
                  overflow: TextOverflow.visible,
                ),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  'BIMBINGAN ',
                  style: blackTextStyle.copyWith(fontSize: 12),
                ),
              ),
              Expanded(
                child: Text(
                  ': ${nilaiMethod.name ?? '-'}',
                  style: blackTextStyle.copyWith(fontSize: 12),
                  overflow: TextOverflow.visible,
                ),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  'LAPORAN PRAKTIKUM ',
                  style: blackTextStyle.copyWith(fontSize: 12),
                ),
              ),
              Expanded(
                child: Text(
                  ': ${nilaiMethod.name ?? '-'}',
                  style: blackTextStyle.copyWith(fontSize: 12),
                  overflow: TextOverflow.visible,
                ),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  'KEHADIRAN ',
                  style: blackTextStyle.copyWith(fontSize: 12),
                ),
              ),
              Expanded(
                child: Text(
                  ': ${nilaiMethod.name ?? '-'}',
                  style: blackTextStyle.copyWith(fontSize: 12),
                  overflow: TextOverflow.visible,
                ),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  'PRILAKU ',
                  style: blackTextStyle.copyWith(fontSize: 12),
                ),
              ),
              Expanded(
                child: Text(
                  ': ${nilaiMethod.name ?? '-'}',
                  style: blackTextStyle.copyWith(fontSize: 12),
                  overflow: TextOverflow.visible,
                ),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  'TUGAS KELOMPOK ',
                  style: blackTextStyle.copyWith(fontSize: 12),
                ),
              ),
              Expanded(
                child: Text(
                  ': ${nilaiMethod.name ?? '-'}',
                  style: blackTextStyle.copyWith(fontSize: 12),
                  overflow: TextOverflow.visible,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          )
        ],
      ),
    );
  }
}
