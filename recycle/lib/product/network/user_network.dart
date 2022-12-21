import 'package:recycle/features/screens/home/model/user_model.dart';
import 'package:vexana/vexana.dart';

class UserNetworkManager extends NetworkManager<INetworkModel<UserModel>> {
  UserNetworkManager() : super(options: BaseOptions(baseUrl: 'https://recycle-d84ec-default-rtdb.firebaseio.com/'));
}
