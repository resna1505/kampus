import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kampus/shared/theme.dart';
import 'package:table_calendar/table_calendar.dart';

class MySchedule extends StatefulWidget {
  const MySchedule({super.key});

  @override
  State<MySchedule> createState() => _MyScheduleState();
}

class _MyScheduleState extends State<MySchedule> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: whiteColor,
        title: Text(
          'My Schedule',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
      ),
      body: content(),
    );
  }

  Widget content() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TableCalendar(
          locale: "en_US",
          rowHeight: 43,
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
          ),
          availableGestures: AvailableGestures.all,
          selectedDayPredicate: (day) => isSameDay(day, today),
          focusedDay: today,
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          onDaySelected: _onDaySelected,
        ),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: whiteColor,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 2.0,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Jadwal Kelas',
                style: greyTextStyle.copyWith(
                  fontSize: 10,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                // 'Kamis, 15 Agustus',
                DateFormat('EEEE, dd MMMM yyyy').format(today),
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/img_no_data.png',
                        ),
                      ),
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Oops ! Looks like you don’t have\nany ',
                      style: blackTextStyle.copyWith(
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: 'active schedule',
                          style: blueTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: semiBold,
                          ),
                        ),
                        TextSpan(
                          text: ' this day',
                          style: blackTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
              const SizedBox(
                height: 180,
              )
            ],
          ),
        )
      ],
    );
  }
}
