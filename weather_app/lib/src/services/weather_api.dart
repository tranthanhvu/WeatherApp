import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_app/src/data/location.dart';
import 'package:weather_app/src/data/weather.dart';
import 'package:weather_app/src/services/base_weather_api.dart';

part 'weather_api.g.dart';

@RestApi()
abstract class WeatherAPI extends BaseWeatherAPI {
  factory WeatherAPI(Dio dio, {String? baseUrl}) = _WeatherAPI;

  factory WeatherAPI.standard(String baseUrl) {
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

  /// q: Pass US Zipcode, UK Postcode, Canada Postalcode, IP address, Latitude/Longitude (decimal degree) or city name
  @override
  @GET('/search.json')
  Future<List<Location>> searchLocations({
    @Query('key') required String apiKey,
    @Query('q', encoded: true) required String q,
    @CancelRequest() CancelToken? cancelToken,
  });

  /// q: Pass US Zipcode, UK Postcode, Canada Postalcode, IP address, Latitude/Longitude (decimal degree) or city name
  @override
  @GET('/current.json')
  Future<Weather> getWeather({
    @Query('key') required String apiKey,
    @Query('q', encoded: true) required String q,
  });
}
