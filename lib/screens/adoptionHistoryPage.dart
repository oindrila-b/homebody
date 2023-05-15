import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homebody/bloc/image_details_bloc.dart';

import '../bloc/image_details_state.dart';
import '../utils/colors.dart';

class AdoptionHistoryPage extends StatelessWidget {
  const AdoptionHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AdoptionBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appBarColor,
          title: const Text("History of Adoptions"),
          leading: BackButton(
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: BlocBuilder<AdoptionBloc, AdoptionState>(
          builder: (context, state) {
            // AdoptionBloc adoptionBloc = BlocProvider.of<AdoptionBloc>(context);
            return const Center(
              child: Text("Adopted list of pets , "),
            );
          },
        ),
      ),
    );
  }
}
