import 'package:flutter/foundation.dart';

@immutable
class LoginHandel {
  final String token;

  const LoginHandel({
    required this.token,
  });

  const LoginHandel.fooBar() : token = 'foobar';

  @override
  bool operator ==(covariant LoginHandel other) => token == other.token;

  @override
  int get hashCode => token.hashCode;

  @override
  String toString() => 'LoginHandle (token = $token)';
}

enum LoginError { invalidHandle }


@immutable
class Note {
  final String title;
 
  const Note({required this.title});

  @override
  String toString() => 'Note (title =$title)';
}

final mockNotes = Iterable.generate(
  3,
  (i) => Note(title: 'Note ${i + 1}'),
);
