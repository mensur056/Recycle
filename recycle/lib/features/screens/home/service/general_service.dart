import 'package:dio/dio.dart';
import 'package:recycle/features/screens/home/model/user_model.dart';

enum HomePath { users }

abstract class IHomeService {
  late final Dio _dio;
  IHomeService(Dio dio) : _dio = dio;
  Future<UserModel?> sendUserItemToService(UserModel model);
}

class HomeService extends IHomeService {
  HomeService(super.dio);

  @override
  Future<UserModel?> sendUserItemToService(UserModel model) async {
    final response = await _dio.post('${HomePath.users.name}.json', data: model);
    return null;
  }
}
