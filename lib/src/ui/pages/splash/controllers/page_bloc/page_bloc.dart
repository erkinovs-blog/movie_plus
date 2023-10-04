import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  final PageController controller;

  PageBloc()
      : controller = PageController(),
        super(PageInitial()) {
    controller.addListener(listenController);
    on<PageEvent>(
        (event, emit) => emit(PageInitial(currentPage: event.currentPage)));
  }

  void listenController() {
    if (controller.page?.round() != state.currentPage) {
      add(PageNewEvent(currentPage: controller.page?.round() ?? 0));
    }
  }

  void onContinuePressed() {
    controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Future<void> close() {
    controller.removeListener(listenController);
    controller.dispose();
    return super.close();
  }
}
