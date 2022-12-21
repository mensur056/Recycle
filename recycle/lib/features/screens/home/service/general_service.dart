import 'package:recycle/features/screens/home/model/user_model.dart';
import 'package:vexana/vexana.dart';

enum HomePath { users }

abstract class IHomeService {
  late final INetworkManager _networkManager;
  IHomeService(INetworkManager networkManager) : _networkManager = networkManager;
  Future<UserModel?> sendUserItemToService(UserModel model);
}

class HomeService extends IHomeService {
  HomeService(super.networkManager);

  @override
  Future<UserModel?> sendUserItemToService(UserModel model) async {
    final response = await _networkManager.send<UserModel, UserModel>('${HomePath.users.name}.json',
        parseModel: UserModel(), method: RequestType.POST, data: model);
    return response.data;
  }
}
