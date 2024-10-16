import 'package:flutter/material.dart';
import 'package:kampus/shared/theme.dart';
import 'package:kampus/ui/widgets/build_absence.dart';
import 'package:kampus/ui/widgets/build_academy.dart';
import 'package:kampus/ui/widgets/build_accounts.dart';
import 'package:kampus/ui/widgets/build_campus_news.dart';
import 'package:kampus/ui/widgets/build_explore.dart';
import 'package:kampus/ui/widgets/build_profile.dart';
import 'package:kampus/ui/widgets/build_schedule.dart';

class HomePageMahasiswa extends StatefulWidget {
  const HomePageMahasiswa({super.key});

  @override
  State<HomePageMahasiswa> createState() => _HomePageMahasiswaState();
}

class _HomePageMahasiswaState extends State<HomePageMahasiswa> {
  int _currentIndex = 0;
  String qrResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      bottomNavigationBar: BottomAppBar(
        // color: whiteColor,
        // shape: const CircularNotchedRectangle(),
        // clipBehavior: Clip.antiAlias,
        // notchMargin: 6,
        // elevation: 0,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          elevation: 0,
          selectedItemColor: purpleColor,
          unselectedItemColor: greyColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: blueTextStyle.copyWith(
            fontSize: 10,
            fontWeight: medium,
          ),
          unselectedLabelStyle: blackTextStyle.copyWith(
            fontSize: 10,
            fontWeight: medium,
          ),
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_home.png',
                width: 25,
                color: _currentIndex == 0 ? purpleColor : greyColor,
              ),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_explore.png',
                width: 25,
                color: _currentIndex == 1 ? purpleColor : greyColor,
              ),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.qr_code_scanner,
                color: _currentIndex == 2 ? purpleColor : greyColor,
                size: 30,
              ),
              label: 'absence',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_chat.png',
                width: 25,
                color: _currentIndex == 3 ? purpleColor : greyColor,
              ),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_account.png',
                width: 25,
                color: _currentIndex == 4 ? purpleColor : greyColor,
              ),
              label: 'Account',
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            // if (index == 1) {
            //   Navigator.pushNamed(context, '/learning-progress');
            // }
          },
        ),
      ),
      body: ListView(
        children: [
          if (_currentIndex == 0) ...[
            const BuildProfile(),
            const BuildSchedule(),
            const BuildAcademy(),
            const BuildCampusNews(),

            // buildCampusNews(context),
            // buildSchedule(),
            // buildToDo(context),
            // buildAcademy(context),
            // buildProfile(context),
          ],
          if (_currentIndex == 1) ...[
            const BuildExplore(),
            // buildExplore(context),
          ],
          if (_currentIndex == 2) ...[
            const BuildAbsence(),
          ],
          if (_currentIndex == 3) ...[
            buildChats(context),
          ],
          if (_currentIndex == 4) ...[
            const BuildAccounts(),
            // buildAccounts(context),
          ],
        ],
      ),
      // body: tabs[_currentIndex],
    );
  }

  Widget buildChats(context) {
    return Column(
      children: [
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: greySoftColor,
                  width: 1,
                ),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Chat',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  Icon(
                    Icons.chat_outlined,
                    color: purpleColor,
                    size: 18,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 8,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search chat',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(
                      color: purpleColor,
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(12),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  // Widget buildToDo(BuildContext context) {
  //   return Container(
  //     padding: const EdgeInsets.symmetric(horizontal: 24),
  //     decoration: BoxDecoration(
  //       color: whiteColor,
  //     ),
  //     child: Column(
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Row(
  //                   children: [
  //                     Container(
  //                       width: 24,
  //                       height: 24,
  //                       decoration: BoxDecoration(
  //                         shape: BoxShape.circle,
  //                         color: redColor,
  //                       ),
  //                       child: Center(
  //                         child: Text(
  //                           '1',
  //                           style: whiteTextStyle.copyWith(
  //                             fontSize: 12,
  //                             fontWeight: medium,
  //                             color: whiteColor,
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     const SizedBox(
  //                       width: 4,
  //                     ),
  //                     Text(
  //                       'My To-Do',
  //                       style: blackTextStyle.copyWith(
  //                         fontSize: 16,
  //                         fontWeight: semiBold,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 const SizedBox(
  //                   height: 4,
  //                 ),
  //                 Text(
  //                   'This is your personal to-do list',
  //                   style: greyTextStyle.copyWith(
  //                     fontSize: 12,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             CustomButtonOutline(
  //               title: 'All To-Do',
  //               onTap: () {
  //                 Navigator.pushNamed(context, '/todo');
  //               },
  //             )
  //           ],
  //         ),
  //         const SizedBox(
  //           height: 8,
  //         ),
  //         Container(
  //           padding: const EdgeInsets.all(
  //             16,
  //           ),
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(16),
  //             color: whiteColor,
  //             boxShadow: const [
  //               BoxShadow(
  //                 color: Colors.grey,
  //                 blurRadius: 5.0,
  //               ),
  //             ],
  //           ),
  //           child: Column(
  //             children: [
  //               HomeToDo(
  //                 title: 'Final Quiz',
  //                 status: 'Incomplete',
  //                 date: '22th, Mar 2024',
  //                 onTap: () {},
  //               ),
  //               HomeToDo(
  //                 title: 'Semester Exam',
  //                 status: 'Completed',
  //                 date: '23th, Feb 2024',
  //                 onTap: () {},
  //               )
  //             ],
  //           ),
  //         ),
  //         const SizedBox(
  //           height: 24,
  //         )
  //       ],
  //     ),
  //   );
  // }
}
