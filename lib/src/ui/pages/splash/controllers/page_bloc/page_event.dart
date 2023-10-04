part of 'page_bloc.dart';

@immutable
abstract class PageEvent {
  abstract final int currentPage;
}

class PageNewEvent extends PageEvent {
  @override
  final int currentPage;

  PageNewEvent({required this.currentPage});
}
