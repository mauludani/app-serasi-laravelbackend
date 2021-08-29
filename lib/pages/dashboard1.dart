part of 'pages.dart';

class Dashboard1 extends StatefulWidget {
  @override
  _Dashboard1State createState() => _Dashboard1State();
}

class _Dashboard1State extends State<Dashboard1> {
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
                              "Absensi Harian",
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
                              keterangan,
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
                              "7 Hari yang lalu",
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
                                              0.3,
                                      child: Text(
                                        "Tanggal",
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
                                              0.35,
                                      child: Text(
                                        "Jam",
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
                                              0.35,
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
                                  ],
                                ),
                              ),
                              Stack(
                                children: [
                                  Container(
                                    height: 270,
                                    child: FutureBuilder(
                                      future: fetchAbsensi(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return ListView.builder(
                                            itemCount: snapshot.data.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              Map absensi =
                                                  snapshot.data[index];
                                              print(absensi['tanggal']);
                                              return ListAbsensi(
                                                  convertDateTime(
                                                      absensi['tanggal']),
                                                  cekKehadiran(
                                                      absensi['tanggal']),
                                                  convertJam(
                                                      absensi['tanggal']));
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
                              // children: [
                              //   Column(
                              //     children: state.absensis
                              //         .map((e) => ListAbsensi(
                              //             convertDateTime(e.tanggal),
                              //             cekKehadiran(e.tanggal),
                              //             convertJam(e.tanggal)))
                              //         .toList(),
                              //   ),
                              // ],
                              // ),
                            ])),
                        Container(
                            margin: EdgeInsets.only(top: 15),
                            child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "Lihat Lainnya",
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          letterSpacing: .5,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700)),
                                )))
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

  
}
