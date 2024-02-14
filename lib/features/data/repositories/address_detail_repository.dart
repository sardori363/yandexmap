// import 'package:dio/dio.dart';
// import 'package:hw26/features/data/models/app_lat_long.dart';

// class AddressDetail{
//   @override
//   Future<AddressDetailModel?> getAddressDetail(AppLatLong latLong) async{
//     String mapApiKey = "10174d2a-8dbb-4fbc-ad03-d5985c385a2e";
//     try{
//       Map<String, String> queryParams = {
//         'apikey': mapApiKey,
//         'geocode': "${latLong.long},${latLong.lat}",
//         'lang':'uz',
//         'format': 'json',
//         'results': '1'
//       };
//       Dio yandexDio = Dio();
//       var resposnse = await yandexDio.get(
//         "https://geocode-maps.yandex.ru/1.x",
//         queryParameters: queryParams,
//       );
//       return AddressDetailModel.fromJson(resposnse.data);
//     } catch(e){
//       print("Error ${e}");
//     }
//   }
// }