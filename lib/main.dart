import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampus/auth_provider.dart';
import 'package:kampus/blocs/auth/auth_bloc.dart';
import 'package:kampus/chat_provider.dart';
import 'package:kampus/firebase_options.dart';
import 'package:kampus/shared/theme.dart';
import 'package:kampus/ui/pages/login_page.dart';
import 'package:kampus/ui/pages/mahasiswa/assessment_page.dart';
import 'package:kampus/ui/pages/mahasiswa/campus_news_detail_page.dart';
import 'package:kampus/ui/pages/mahasiswa/campus_news_page.dart';
import 'package:kampus/ui/pages/mahasiswa/card_mahasiswa_page.dart';
import 'package:kampus/ui/pages/mahasiswa/confirm_absent_page.dart';
import 'package:kampus/ui/pages/mahasiswa/home_page.dart';
import 'package:kampus/ui/pages/mahasiswa/input_krs_page.dart';
import 'package:kampus/ui/pages/mahasiswa/invoice_payment_page.dart';
import 'package:kampus/ui/pages/mahasiswa/khs_page.dart';
import 'package:kampus/ui/pages/mahasiswa/krs_page.dart';
import 'package:kampus/ui/pages/mahasiswa/learning_progress_page.dart';
import 'package:kampus/ui/pages/mahasiswa/lecturer_consultation_page.dart';
import 'package:kampus/ui/pages/mahasiswa/manage_account_page.dart';
import 'package:kampus/ui/pages/mahasiswa/manage_profile_page.dart';
import 'package:kampus/ui/pages/mahasiswa/my_schedule_page.dart';
import 'package:kampus/ui/pages/mahasiswa/notification_page.dart';
import 'package:kampus/ui/pages/mahasiswa/thesis_page.dart';
import 'package:kampus/ui/pages/mahasiswa/todo_page.dart';
import 'package:kampus/ui/pages/mahasiswa/transcript_page.dart';
import 'package:kampus/ui/pages/splash_page.dart';
import 'package:kampus/ui/pages/mahasiswa/notification_detail.dart';
import 'package:provider/provider.dart';

// void main() => runApp(const MyApp());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ChatProvider()),
        BlocProvider(
          create: (context) => AuthBloc()..add(AuthGetCurrentUser()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: lightBackgroundColor,
          appBarTheme: AppBarTheme(
            backgroundColor: lightBackgroundColor,
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(color: blackColor),
            titleTextStyle: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
        ),
        routes: {
          '/': (context) => const SplashPage(),
          '/login-page': (context) => const LoginPage(),
          '/home-page-mahasiswa': (context) => const HomePageMahasiswa(),
          '/notification-mahasiswa': (context) => const NotificationPage(),
          '/my-schedule': (context) => const MySchedule(),
          '/manage-profile': (context) => const ManageProfile(),
          '/manage-account': (context) => const ManageAccount(),
          '/notification-detail': (context) => const NotificationDetail(),
          '/card-mahasiswa': (context) => const CardMahasiswaPage(),
          '/confirm-absent': (context) => const ConfirmAbsentPage(),
          '/invoice-payment': (context) => const InvoicePaymentPage(),
          '/krs': (context) => const KRSPage(),
          '/khs': (context) => const KHSPage(),
          '/thesis': (context) => const ThesisPage(),
          '/lecturer-consultation': (context) =>
              const LecturerConsultationPage(),
          '/transcript': (context) => const TranscriptPage(),
          '/learning-progress': (context) => const LearningProgress(),
          '/assessment': (context) => const AssessmentPage(),
          '/input-krs': (context) => const InputKRS(),
          '/campus-news-detail': (context) => const CampusNewsDetail(),
          '/campus-news': (context) => const CampusNews(),
          '/todo': (context) => const ToDoPage(),
        },
      ),
    );
  }
}
