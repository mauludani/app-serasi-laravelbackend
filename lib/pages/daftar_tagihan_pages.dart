part of 'pages.dart';

class DaftarTagihanPages extends StatefulWidget {
  @override
  _DaftarTagihanPagesState createState() => _DaftarTagihanPagesState();
}

class _DaftarTagihanPagesState extends State<DaftarTagihanPages> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String nama = "";

  String keterangan = "Hari Ini Libur / Petugas belum unggah data";
  @override
  void initState() {
    super.initState();
    getData();

    OneSignal.shared
        .setNotificationReceivedHandler((OSNotification notification) {
      // will be called whenever a notification is received
    });
  }

  void getData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await OneSignal.shared.setSubscription(true);
    nama = sp.getString("name") ?? 'nama';

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      // will be called whenever a notification is opened/button pressed.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: "F4F4F5".toColor(),
        body: RefreshIndicator(
          onRefresh: () {
            Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                    pageBuilder: (a, b, c) => MainPage(),
                    transitionDuration: Duration(seconds: 0)));
            return Future.value(false);
          },
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                    height: 60,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _scaffoldKey.currentState.openDrawer();
                              },
                              child: Icon(
                                Icons.menu,
                                color: "262922".toColor(),
                                size: 28.0,
                              ),
                            ),
                            SizedBox(
                              width: 24,
                            ),
                            Text(
                              (context.read<UserCubit>().state as UserLoaded)
                                  .user
                                  .nama,
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    color: Colors.grey,
                                    letterSpacing: .5,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.5),
                              image: DecorationImage(
                                  image: AssetImage("assets/profile.png"),
                                  fit: BoxFit.cover)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: "F4F4F5".toColor(),
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 24),
                            child: Text(
                              "Total Tagihan",
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      letterSpacing: .5,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700)),
                            )),
                        Container(
                          width: double.infinity,
                          height: 82,
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              color: "69686D".toColor()),
                          child: Center(
                            child: Text(
                              "-",
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: .5,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700)),
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 24),
                            child: Text(
                              "Daftar Tagihan",
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      letterSpacing: .5,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700)),
                            )),
                        Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 10),
                            padding: EdgeInsets.symmetric(vertical: 24),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              color: "FFFFFF".toColor(),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 0,
                                  blurRadius: 6,
                                  offset: Offset(
                                      0, 6), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(children: [
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                margin: EdgeInsets.only(bottom: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width:
                                          (context.mediaQuery.size.width - 68) *
                                              0.6,
                                      child: Text(
                                        "Keterangan",
                                        style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                                color: Colors.black,
                                                letterSpacing: .5,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700)),
                                      ),
                                    ),
                                    Container(
                                      width:
                                          (context.mediaQuery.size.width - 68) *
                                              0.4,
                                      child: Text(
                                        "Tagihan",
                                        style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                                color: Colors.black,
                                                letterSpacing: .5,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Stack(
                                children: [
                                  Container(
                                    height: 270,
                                    child: FutureBuilder(
                                      future: fetchDaftarTagihan(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return ListView.builder(
                                            itemCount: snapshot.data.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              Map absensi =
                                                  snapshot.data[index];
                                              print(absensi['tanggal']);
                                              return ListTagihan(absensi['ket'],
                                                  rupiah(absensi['bayar']));
                                            },
                                          );
                                        }
                                        return Center(
                                            child: CircularProgressIndicator());
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ])),
                        // Container(
                        //     margin: EdgeInsets.only(top: 15),
                        //     child: ElevatedButton(
                        //         onPressed: () {},
                        //         child: Text(
                        //           "Lihat Lainnya",
                        //           style: GoogleFonts.lato(
                        //               textStyle: TextStyle(
                        //                   color: Colors.white,
                        //                   letterSpacing: .5,
                        //                   fontSize: 14,
                        //                   fontWeight: FontWeight.w700)),
                        //         )))
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        drawer: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.white,
            ),
            child: Drawer(child: MySidebar())));
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
}
