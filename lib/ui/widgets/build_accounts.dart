import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampus/blocs/auth/auth_bloc.dart';
import 'package:kampus/shared/shared_methods.dart';
import 'package:kampus/shared/theme.dart';

class BuildAccounts extends StatelessWidget {
  const BuildAccounts({super.key});

  @override
  Widget build(context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailed) {
          showCustomSnackbar(context, state.e);
        }
        if (state is AuthInitial) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/login-page',
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            padding: const EdgeInsets.only(
              left: 20,
              right: 10,
              top: 10,
              bottom: 16,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/manage-account');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.system_security_update_warning_outlined,
                              color: purpleColor,
                              size: 18,
                            ),
                            const SizedBox(
                              width: 18,
                            ),
                            Text(
                              'Manage Account',
                              style: blackTextStyle.copyWith(
                                fontSize: 16,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.navigate_next,
                              color: purpleColor,
                              size: 18,
                            ),
                            const SizedBox(
                              width: 8,
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // _openUrl(
                        //     "https://drive.google.com/drive/folders/1imK8yqWJlvN6RnIrv0uqenoDs1pG7RYB");
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.health_and_safety_outlined,
                              color: purpleColor,
                              size: 18,
                            ),
                            const SizedBox(
                              width: 18,
                            ),
                            Text(
                              'User Guide',
                              style: blackTextStyle.copyWith(
                                fontSize: 16,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.navigate_next,
                              color: purpleColor,
                              size: 18,
                            ),
                            const SizedBox(
                              width: 8,
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.pushNamed(context, '/login-page');
                        context.read<AuthBloc>().add(AuthLogout());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout_outlined,
                              color: purpleColor,
                              size: 18,
                            ),
                            const SizedBox(
                              width: 18,
                            ),
                            Text(
                              'Log Out',
                              style: blackTextStyle.copyWith(
                                fontSize: 16,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.navigate_next,
                              color: purpleColor,
                              size: 18,
                            ),
                            const SizedBox(
                              width: 8,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
