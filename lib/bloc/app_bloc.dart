import 'package:app/apis/login_api.dart';
import 'package:app/apis/notes_api.dart';
import 'package:app/bloc/actions.dart';
import 'package:app/bloc/app_state.dart';
import 'package:app/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc extends Bloc<AppAction, AppState> {
  final LoginApiProtocol loginApi;
  final NotesApiProtocol notesApi;
 
  AppBloc({required this.loginApi, required this.notesApi})
      : super(const AppState.empty()) {
    on<LoginAction>((event, emit) async {
      // start loading
      emit(
        const AppState(
          isLoading: true,
          loginError: null,
          loginHandel: null,
          fetchedNotes: null,
        ),
      );

      //log the user in
      final loginHandel = await loginApi.login(
        email: event.email,
        password: event.password,
      );
      emit(
        AppState(
          isLoading: false,
          loginError: loginHandel == null ? LoginError.invalidHandle : null,
          loginHandel: loginHandel,
          fetchedNotes: null,
        ),
      );

      on<LoadNotesAction>(
        (event, emit) async {
          // start loading
          emit(
            AppState(
              isLoading: true,
              loginError: null,
              loginHandel: state.loginHandel,
              fetchedNotes: null,
            ),
          );

          //get the Login Handel
          final loginHandel = state.loginHandel;
          if (loginHandel != const LoginHandel.fooBar()) {
            //invalid login handel, cannot fetch notes

            emit(
              AppState(
                isLoading: false,
                loginError: LoginError.invalidHandle,
                loginHandel: loginHandel,
                fetchedNotes: null,
              ),
            );
            return;
          }

          // we have a valid Login handel and want to fetch notes
          final notes = await notesApi.getNotes(
            loginHandel: loginHandel!,
          );
          emit(
            AppState(
              isLoading: false,
              loginError: null,
              loginHandel: loginHandel,
              fetchedNotes: notes,
            ),
          );
        },
      );
    });
  }
}
