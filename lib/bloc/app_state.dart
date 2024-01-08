import 'package:app/models.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class AppState {
  final bool isLoading;
  final LoginError? loginError;
  final LoginHandel? loginHandel;
  final Iterable<Note>? fetchedNotes;

  const AppState.empty()
      : isLoading = false,
        loginError = null,
        loginHandel = null,
        fetchedNotes = null;

  const AppState({
    required this.isLoading,
    required this.loginError,
    required this.loginHandel,
    required this.fetchedNotes,
  });

  @override
  String toString() => {
        'isLoading': isLoading,
        'loginError': loginError,
        'fetchedNotes': fetchedNotes,
        'loginHandle': loginHandel,
      }.toString();
}
