import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homebody/bloc/image_details_bloc.dart';
import 'package:homebody/screens/home.dart';

void main() {
  runApp(
    BlocProvider<AdoptionBloc>(
      create: (_) => AdoptionBloc(),
      child: const MaterialApp(
        home: HomePage(),
      ),
    ),
  );
}
