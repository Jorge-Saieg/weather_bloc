import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/blocs/weather_bloc/weather_event.dart';

import 'package:weather_bloc/pages/weather_page.dart';
import 'package:weather_bloc/api/weather_api.dart';
// import 'package:weather_bloc/api/weather_db.dart';
import 'package:weather_bloc/blocs/city_bloc/city_bloc.dart';
import 'package:weather_bloc/blocs/weather_bloc/weather_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CityBloc>(
          create: (BuildContext context) => CityBloc(WeatherApi()),
        ),
        BlocProvider<WeatherBloc>(
          create: (BuildContext context) => WeatherBloc(WeatherApi()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather with Bloc'),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'Busqueda por ciudad',
            style: TextStyle(
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
          Divider(
            height: 5,
          ),
          TextField(
            onSubmitted: (value) => {
              print('Submitted: $value'),
              context.read<CityBloc>().add(GetCities(value))
            },
            controller: _controller,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 26),
          ),
          SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () =>
                  context.read<CityBloc>().add(GetCities(_controller.text)),
              child: Text('Obtener Clima'),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          BlocBuilder<CityBloc, CityState>(
            builder: (context1, state) {
              if (state is CityInitial) {
                return Container();
              } else if (state is LoadingCitiesState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is LoadedCitiesState) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.cities.length,
                    itemBuilder: (context, int index) {
                      return ListTile(
                        title: Text(state.cities[index].city),
                        trailing: Icon(Icons.arrow_forward),
                        onTap: () => {
                          BlocProvider.of<WeatherBloc>(context)
                              .add(SelectedCity(state.cities[index].id)),
                          // context.read<WeatherBloc>.add(
                          //     SelectedCity(state.cities[index].id)),
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WeatherPage(),
                            ),
                          ),
                        },
                      );
                    });
              } else {
                return Text('Error');
              }
            },
          ),
        ],
      ),
    );
  }
}
