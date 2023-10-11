import 'package:flutter/material.dart';
import 'package:movie_plus_app/l10n/app_localizations.dart';

class Translate extends StatelessWidget {
  const Translate({
    super.key,
    required this.builder,
    this.child,
  });

  final Widget Function(
      BuildContext context, AppLocalizations l10n, Widget? child) builder;
  final Widget? child;

  @override
  Widget build(BuildContext context) =>
      builder(context, AppLocalizations.of(context), child);
}

AppLocalizations translate(BuildContext context) =>
    AppLocalizations.of(context);
