import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homebody/widgets/widget_pet_list.dart';

import '../bloc/image_details_bloc.dart';
import '../bloc/image_details_event.dart';
import '../bloc/image_details_state.dart';
import '../utils/colors.dart';

class AdoptionHistoryPage extends StatefulWidget {
  const AdoptionHistoryPage( {Key? key}) : super(key: key);

  @override
  State<AdoptionHistoryPage> createState() => _AdoptionHistoryPageState();
}

class _AdoptionHistoryPageState extends State<AdoptionHistoryPage> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text("Your Adoptions!"),
        centerTitle: true,
        leading: BackButton(
          onPressed: () => Navigator.pop(context),

        ),
      ),
      body: SizedBox(
        child: BlocConsumer<AdoptionBloc, AdoptionState>(
             listener: (context, state) {},
            builder: (context, state) {
            if( state is AdoptedListState) {
              return PetGridView(pets: state.adoptedList);
            }
            return Center(
              child: Text("No Pets Adopted Yet"),
            );
      }
      ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<AdoptionBloc>().add(GetAdoptedListEvent());
  }
}
