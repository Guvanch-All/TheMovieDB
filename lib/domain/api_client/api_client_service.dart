
import 'package:chopper/chopper.dart';

part 'api_client_service.chopper.dart';

@ChopperApi(baseUrl: 'https://api.themoviedb.org/3')
abstract class ApiClients extends ChopperService{
static const API= 'https://api.themoviedb.org/3';
static const headers = {
  'apiKey': '727566a27ad0d3762bf9fecaabcf647d',
};
@Get(path: '')
  Future<Response<String>> auth(@Query() String username,@Query() String password);

}