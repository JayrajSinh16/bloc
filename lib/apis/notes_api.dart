import 'package:app/models.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class NotesApiProtocol {
  const NotesApiProtocol();

  Future<Iterable<Note>?> getNotes({
    required LoginHandel loginHandel,
  });
}

@immutable
class NotesApi implements NotesApiProtocol {


  @override
  Future<Iterable<Note>?> getNotes({
    required LoginHandel loginHandel,
  }) =>
      Future.delayed(
        const Duration(seconds: 2),
        () => loginHandel == const LoginHandel.fooBar() ? mockNotes : null,
      );

}
