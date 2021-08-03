import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_bloc/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_bloc/blocs/weather_bloc/weather_state.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is LoadedWeatherState) {
              return Text(state.city);
            } else {
              return Text('Loading...');
            }
          },
        ),
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is InitalWeatherState) {
            return Column(
              children: [
                Center(child: Text('Inicial')),
              ],
            );
          } else if (state is LoadingWeatherState) {
            return Center(
              child: Text('Cargando...'),
            );
          } else if (state is LoadedWeatherState) {
            return Center(
              child: Text(
                state.temp.toStringAsFixed(2) + '°C',
                style: TextStyle(color: Colors.green, fontSize: 60),
              ),
            );
          } else if (state is ErrorWeatherState) {
            return Text('Error');
          } else {
            return Text('chan chan');
          }
        },
      ),
    );
  }
}
