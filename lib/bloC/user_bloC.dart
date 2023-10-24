import 'package:bloc_api_calling/Model/user_model.dart';
import 'package:bloc_api_calling/Service/api_service.dart';
import 'package:bloc_api_calling/bloC/user_event.dart';
import 'package:bloc_api_calling/bloC/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsurBloc extends Bloc<UsurEvent,UsurState>{

  List<UsurModel>userModellist =[];

  UsurBloc():super(UsurInit()){

   ApiService _apiservice =ApiService();

    on<GetAllUsurList>((event, emit)async{

   try{
    emit(UsurLoading());
    userModellist =await _apiservice.getData();
    emit(UsurDataLoaded(userModellist));

   }catch(e){
    emit(UsurError(e.toString()));
   }

    });
  }
}