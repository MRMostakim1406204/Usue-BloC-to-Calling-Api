import 'package:bloc_api_calling/Model/user_model.dart';
import 'package:bloc_api_calling/bloC/user_bloC.dart';
import 'package:bloc_api_calling/bloC/user_event.dart';
import 'package:bloc_api_calling/bloC/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<UsurBloc>().add(GetAllUsurList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BloC Pattern"),
        centerTitle: true,
      ),
      body: BlocBuilder<UsurBloc,UsurState>(
        builder: (context,State){
          if(State is UsurLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(State is UsurError){
           return Center(
            child: Text(State.message),
           );
          }

         if (State is UsurDataLoaded){
          return _view(context,State.usurModellist);
         }
         return Container();

        },),
    );
  }

Widget _view(BuildContext context,List<UsurModel>usurModellist){
  return ListView.builder(
    itemBuilder: (context,itemIndex){
    UsurModel usurModel =usurModellist[itemIndex];
    return ListTile(
      title: Text(usurModel.name.toString()),
      subtitle: Text(usurModel.email.toString()),
      leading: Text(usurModel.id.toString()),
      trailing: Text(usurModel.hashCode.toString()),
      );
  },);
}

}