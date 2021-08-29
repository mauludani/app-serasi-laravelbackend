
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_utils/get_utils.dart';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:serasi/cubit/cubit.dart';
import 'package:serasi/services/services.dart';
import 'package:serasi/theme/shared.dart';
import 'package:serasi/widgets/widgets.dart';
import 'package:supercharged/supercharged.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

part 'welcome_pages.dart';
part 'welcome1.dart';
part 'welcome2.dart';
part 'welcome3.dart';
part 'login_pages.dart';
part 'dashboard1.dart';
part 'dashboard2.dart';
part 'main_pages.dart';
part 'splash.dart';
part 'daftar_bayar_pages.dart';
part 'daftar_tagihan_pages.dart';
part 'main_menu_pages.dart';
part 'homepages.dart';
part 'notification_pages.dart';
part 'absensi_pages.dart';
part 'nilai_pages.dart';

String rupiah(value) {
  return "Rp " +
      value.toString().replaceAllMapped(
          new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.');
}

String convertDateTime(date) {
    DateTime dateTime = DateTime.parse(date);
    String month;

    switch (dateTime.month) {
      case 1:
        month = 'Jan';
        break;
      case 2:
        month = 'Feb';
        break;
      case 3:
        month = 'Mar';
        break;
      case 4:
        month = 'Apr';
        break;
      case 5:
        month = 'May';
        break;
      case 6:
        month = 'Jun';
        break;
      case 7:
        month = 'Jul';
        break;
      case 8:
        month = 'Agu';
        break;
      case 9:
        month = 'Sep';
        break;
      case 10:
        month = 'Oct';
        break;
      case 11:
        month = 'Nov';
        break;
      default:
        month = "Des";
    }
    if (dateTime.day == DateTime.now().day &&
        dateTime.month == DateTime.now().month &&
        dateTime.year == DateTime.now().year) {
      return "Hari ini";
    }
    return '${dateTime.day} ' + month + ' ${dateTime.year}';
  }

  String convertJam(date) {
    DateTime dateTime = DateTime.parse(date);
    return '${dateTime.hour}:${dateTime.minute}:${dateTime.second}';
  }

  String cekKehadiran(date) {
    DateTime dateTime = DateTime.parse(date);
    DateTime masuk = DateTime.parse("0000-00-00 07:00:00");
    if (dateTime.hour < masuk.hour) {
      return "Tidak Terlambat";
    }
    return "Terlambat";
  }