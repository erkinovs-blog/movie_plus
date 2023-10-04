part of 'page_bloc.dart';

@immutable
abstract class PageState {
  abstract final int currentPage;
}

class PageInitial extends PageState {
  @override
  final int currentPage;

  PageInitial({int? currentPage}) : currentPage = currentPage ?? 0;
}
