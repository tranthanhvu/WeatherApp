import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/cubits/settings/settings_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  // final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: Text('Unit of Temperature'),
                      ),
                      DropdownButton<TemperatureUnit>(
                        value: state.temperatureUnit,
                        onChanged: (unit) {
                          context.read<SettingsCubit>().changeTemperatureUnit(
                              unit ?? TemperatureUnit.celsius);
                        },
                        items: TemperatureUnit.values.map(
                          (e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(e.unit),
                            );
                          },
                        ).toList(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
