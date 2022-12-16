import 'package:dio/dio.dart';
import 'package:recycle/product/core/model/user_model.dart';

abstract class IService {
  Future<UserModel?> sendUserItemToService(UserModel model);
}

class GeneralService extends IService {
  Dio dio = Dio(
    BaseOptions(baseUrl: 'https://recycle-d84ec-default-rtdb.firebaseio.com/'),
  );

  @override
  Future<UserModel?> sendUserItemToService(UserModel model) async {
    final response = await dio.post('users.json', data: model);
    return response.data;
  }
}
