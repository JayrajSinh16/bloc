import 'package:app/bloc/app_bloc.dart';

class ButtomBloc extends AppBloc {
  ButtomBloc({
    Duration? waitBeforeLoading,
    required Iterable<String> urls,
  }) : super (
    waitBeforeLoading: waitBeforeLoading,
    urls: urls,
  );
}