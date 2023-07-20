// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:wheter_app/fetures/home/repository/weather_repository.dart';
// import 'package:wheter_app/fetures/home/widgets/additional_info_.dart';
// import 'package:wheter_app/fetures/home/widgets/hourly_forcast_item.dart';

// class WeatherScreen extends StatefulWidget {
//   const WeatherScreen({super.key});

//   @override
//   State<WeatherScreen> createState() => _WeatherScreenState();
// }

// class _WeatherScreenState extends State<WeatherScreen> {
//   WeatherRepo weatherRepo = WeatherRepo();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   centerTitle: true,
//       //   title: const Text(
//       //     'Weather',
//       //     style: TextStyle(fontWeight: FontWeight.bold),
//       //   ),
//       //   actions: [
//       //     IconButton(
//       //       onPressed: () {
//       //         setState(() {});
//       //       },
//       //       icon: const Icon(
//       //         Icons.refresh,
//       //       ),
//       //     ),
//       //   ],
//       // ),
//       body: FutureBuilder(
//         future: weatherRepo.getCurrentWeather(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator.adaptive(),
//             );
//           }
//           if (snapshot.hasError) {
//             return Center(
//               child: Text(snapshot.error.toString()),
//             );
//           }
//           final data = snapshot.data!;

//           final currentWeatherData = data['list'][0];

//           final temperatureInKelvin = currentWeatherData['main']['temp'];
//           double temperatureInCelsius = temperatureInKelvin - 273.15;
//           final currentSky = currentWeatherData['weather'][0]['main'];
//           final currentPressure = currentWeatherData['main']['pressure'];
//           final currentWindSpeed = currentWeatherData['wind']['speed'];
//           final currentHumidity = currentWeatherData['main']['humidity'];
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 //main Card
//                 SizedBox(
//                   width: double.infinity,
//                   child: Card(
//                     elevation: 10,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(16),
//                       child: BackdropFilter(
//                         filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//                         child: Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: Column(
//                             children: [
//                               Text(
//                                 '${temperatureInCelsius.toStringAsFixed(2)} °C',
//                                 style: const TextStyle(
//                                   fontSize: 32,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               const SizedBox(height: 16),
//                               Icon(
//                                 currentSky == "Clouds" || currentSky == "Rain"
//                                     ? Icons.cloud_circle
//                                     : Icons.sunny,
//                                 size: 65,
//                               ),
//                               Text(
//                                 currentSky,
//                                 style: const TextStyle(
//                                   fontSize: 20,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),

//                 const Text(
//                   'Weather Forecase',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 //weather forecast cards
//                 SizedBox(
//                   height: 120,
//                   child: ListView.builder(
//                     itemCount: 5,
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (context, index) {
//                       final hourlyForecast = data['list'][index + 1];
//                       final hourlySky =
//                           data['list'][index + 1]['weather'][0]['main'];
//                       final hourlyTemp =
//                           hourlyForecast['main']['temp'].toString();
//                       final time = DateTime.parse(hourlyForecast['dt_txt']);
//                       return HourlyForecastItem(
//                         time: DateFormat.j().format(time),
//                         tempreature: hourlyTemp,
//                         icon: hourlySky == 'Clouds' || hourlySky == 'Rain'
//                             ? Icons.cloud
//                             : Icons.sunny,
//                       );
//                     },
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 const Text(
//                   'Additional Information',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 18),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     AdditionalInfo(
//                       icon: Icons.water_drop,
//                       lebal: 'Humidity',
//                       value: currentHumidity.toString(),
//                     ),
//                     AdditionalInfo(
//                       icon: Icons.air,
//                       lebal: 'Wind Speed',
//                       value: currentWindSpeed.toString(),
//                     ),
//                     AdditionalInfo(
//                       icon: Icons.beach_access,
//                       lebal: 'pressure',
//                       value: currentPressure.toString(),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
