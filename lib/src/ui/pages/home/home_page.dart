import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_plus_app/src/common/constants/app_colors.dart';
import 'package:movie_plus_app/src/common/routes/app_routes.dart';
import 'package:movie_plus_app/src/ui/pages/auth/bloc/auth_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.exit_to_app),
        onPressed: () {
          context.read<AuthBloc>().logOut().then(
                (value) => Navigator.pushNamed(
                  context,
                  AppRoutes.initialRoute,
                ),
              );
        },
      ),
      body: Center(
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Text(
              state.user == null
                  ? "User not found"
                  : "id: ${state.user!.id}\n"
                      "email: ${state.user!.email}\n"
                      "name: ${state.user!.name}\n",
              style: const TextStyle(color: AppColors.white),
            );
          },
        ),
      ),
    );
  }
}
