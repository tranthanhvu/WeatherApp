import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_app/src/data/location.dart';
import 'package:weather_app/src/services/base_weather_api.dart';

part 'weather_api.g.dart';

const String kWeatherAPIBaseUrl = 'http://api.weatherapi.com/v1';

@RestApi()
abstract class WeatherAPI extends BaseWeatherAPI {
  factory WeatherAPI(Dio dio, {String? baseUrl}) = _WeatherAPI;

  factory WeatherAPI.standard({String baseUrl = kWeatherAPIBaseUrl}) {
    var options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 8000), // 8s
      receiveTimeout: const Duration(seconds: 8000), // 8s
      responseType: ResponseType.json,
    );

    Dio dio = Dio(options);

    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));

    return WeatherAPI(dio);
  }

  @override
  @GET('/search.json')
  Future<List<Location>> searchLocations({
    @Query('key') required String apiKey,
    @Query('q', encoded: true) required String q,
    @CancelRequest() CancelToken? cancelToken,
  });
}