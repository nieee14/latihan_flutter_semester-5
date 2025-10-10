// import 'package:dio/dio.dart';
// import '../helpers/api_client.dart';
// import '../model/pegawai.dart';

// class PegawaiService {
//   final _api = ApiClient();

//   Future<List<Pegawai>> listData() async {
//     final Response res = await _api.get('pegawai');
//     final list = res.data is List ? res.data as List : (res.data['data'] as List);
//     return list.map((e) => Pegawai.formJson(Map<String, dynamic>.from(e))).toList();
//   }

//   Future<Pegawai> simpan(Pegawai p) async {
//     final Response res = await _api.post('pegawai', p.toJson());
//     final data = res.data is Map ? res.data :  res.data['data'];
//     return Pegawai.formJson(Map<String, dynamic>.from(data));
//   }

//   Future<Pegawai> ubah(Pegawai p, String id) async {
//     final Response res = await _api.post('pegawai', p.toJson());
//     final data = res.data is Map ? res.data : res.data['data'];
//     return Pegawai.formJson(Map<String, dynamic>.from(data));
//   }

//   Future<Pegawai> getById(String id) async {
//     final Response res = await _api.get('pegawai/$id');
//     final data = res.data is Map ? res.data : res.data['data'];
//     return Pegawai.formJson(Map<String, dynamic>.from(data));
//   }

//   Future<bool> hapus(String id) async {
//     final Response res = await _api.delete('pegawai/$id');
//     return res.statusCode == 200 || res.statusCode == 204;
//   }
// }