import 'dart:convert';
import 'dart:developer';

// import 'package:file/file.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:serasi/models/models.dart';
import 'package:http/http.dart' as http;

part 'config.dart';
part 'user_services.dart';
// part 'absensi_services.dart';
part 'absensi_new_services.dart';
part 'tanggal_services.dart';
part 'nilai_services.dart';
part 'daftarbayar_services.dart';

String baseURL = "https://smktrisakti.imajicreativa.com/api/";
// String baseURL = "https://serasi.imajicreativa.com/api/";
