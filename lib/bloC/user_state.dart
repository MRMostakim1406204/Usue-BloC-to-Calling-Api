import 'package:bloc_api_calling/Model/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class UsurState extends Equatable{

}
class UsurInit extends UsurState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class UsurLoading extends UsurState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
// ignore: must_be_immutable
class UsurDataLoaded extends UsurState{

 List<UsurModel>usurModellist;
 UsurDataLoaded(this.usurModellist);

  @override
  // TODO: implement props
  List<Object?> get props => [usurModellist];

}
// ignore: must_be_immutable
class UsurError extends UsurState{
  String message;
  UsurError(this.message);
  
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
