import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_plus_app/src/ui/controllers/not_connect/connection/connection_bloc.dart'
    as bloc;
import 'package:movie_plus_app/src/ui/utils/functions.dart';

class ConnectionListener extends StatelessWidget {
  const ConnectionListener({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<bloc.ConnectionBloc, bloc.ConnectionState>(
      listener: (context, state) {
        if (state is bloc.NotConnected) {
          showSnackBar(context: context, text: "You are offline");
        } else {
          showSnackBar(context: context, text: "Back to online");
        }
      },
      listenWhen: (previous, current) => previous is! bloc.ConnectionInitial,
      child: child,
    );
  }
}
