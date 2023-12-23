import 'package:flutter/widgets.dart';
import 'package:weather_app/src/data/weather_condition.dart';
import 'package:weather_app/src/generated/assets.gen.dart';

class WeatherConditionImage extends StatelessWidget {
  const WeatherConditionImage({
    super.key,
    required this.condition,
    this.imageSize = 128,
  });

  final WeatherCondition condition;
  final double imageSize;

  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
      width: imageSize,
      height: imageSize,
      fadeOutDuration: const Duration(milliseconds: 100),
      fadeInDuration: const Duration(milliseconds: 300),
      placeholder: Assets.images.defaultImage.path,
      image: 'https:${condition.icon}',
      imageErrorBuilder: (context, error, stackTrace) {
        return Assets.images.defaultImage.image();
      },
      fit: BoxFit.cover,
    );
  }
}
