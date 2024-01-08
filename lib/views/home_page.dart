import 'package:app/bloc/buttom_bloc.dart';
import 'package:app/bloc/top_bloc.dart';
import 'package:app/models/constants.dart';
import 'package:app/views/app_bloc_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: MultiBlocProvider(
          providers: [
            BlocProvider<TopBloc>(
              create: (context) => TopBloc(
                urls: images,
                waitBeforeLoading: const Duration(seconds: 3),
              ),
            ),
             BlocProvider<ButtomBloc>(
              create: (context) => ButtomBloc(
                urls: images,
                waitBeforeLoading: const Duration(seconds: 3),
              ),
            ),
          ],
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              AppBlocView<TopBloc>(),
              AppBlocView<ButtomBloc>(),
            ],
          ),
        ),
      ),
    );
  }
}
