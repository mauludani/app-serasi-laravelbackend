part of 'pages.dart';

class AbsensiPages extends StatefulWidget {
  const AbsensiPages({Key key}) : super(key: key);

  @override
  _AbsensiPagesState createState() => _AbsensiPagesState();
}

class _AbsensiPagesState extends State<AbsensiPages> {
  String keterangan = "Hari Ini Libur / Petugas belum unggah data";
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.white,
          ),
          child: Drawer(child: MySidebar())),
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86.0),
        child: Container(
          color: Color(0xffFFFFFF),
          child: Column(
            children: [
              AppBar(
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: biruColor,
                  statusBarIconBrightness: Brightness.light,
                  systemNavigationBarColor: Colors.white,
                  systemNavigationBarIconBrightness: Brightness.dark,
                ),
                centerTitle: true,
                title: Text(
                  (context.read<UserCubit>().state as UserLoaded)
                      .user
                      .nama
                      .toUpperCase(),
                  style: font.copyWith(
                    color: putihColor,
                    letterSpacing: .5,
                    fontWeight: bold,
                    fontSize: 16,
                  ),
                ),
                iconTheme: IconThemeData(
                  color: Color(0xffFFFFFF), //change your color here
                ),
                backgroundColor: biruColor,
                elevation: 0,
              ),
              Container(
                  height: 30,
                  width: double.infinity,
                  color: biruColor,
                  child: Container(
                    width: double.infinity,
                    height: 30,
                    decoration: BoxDecoration(
                        color: "FFFFFF".toColor(),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        )),
                  )),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          SafeArea(
              child: Container(
            decoration: BoxDecoration(
              gradient: mainBackground,
            ),
          )),
          SafeArea(
            child: RefreshIndicator(
              onRefresh: () {
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (a, b, c) => AbsensiPages(),
                        transitionDuration: Duration(seconds: 0)));
                return Future.value(false);
              },
              child: ListView(
                children: [
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                child: Text("Absensi Harian",
                                    style: font.copyWith(
                                        fontWeight: bold, fontSize: 16))),
                            Container(
                              width: double.infinity,
                              height: 100,
                              margin: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                      width: double.infinity,
                                      height: 86,
                                      margin: EdgeInsets.only(
                                          top: 8, left: 14, right: 14),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(11),
                                          color: Color(0xffA2C4FF))),
                                  Container(
                                    width: double.infinity,
                                    height: 86,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(11),
                                        color: Color(0xff22314B)),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          buildBlur(
                                            borderRadius:
                                                BorderRadius.circular(9),
                                            child: Container(
                                              width: 54,
                                              height: 54,
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(9),
                                                  color: Colors.white
                                                      .withOpacity(0.5)),
                                              child: Image(
                                                image: AssetImage(
                                                    'assets/icon1.png'),
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width:
                                                context.mediaQuery.size.width -
                                                    132,
                                            child: Text(
                                                "Hari Ini Libur / Petugas Belum unggah data",
                                                style: font.copyWith(
                                                    fontSize: 12,
                                                    fontWeight: bold,
                                                    color: Color(0xffFFFFFF))),
                                          )
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Text("Riwayat",
                                    style: font.copyWith(
                                        fontWeight: bold, fontSize: 16))),
                            Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(top: 10),
                                padding: EdgeInsets.symmetric(vertical: 24),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(11),
                                  color: "FFFFFF".toColor(),
                                  boxShadow: [
                                    shadow,
                                  ],
                                ),
                                child: Column(children: [
                                  Container(
                                    width: double.infinity,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    margin: EdgeInsets.only(bottom: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width:
                                              (context.mediaQuery.size.width -
                                                      68) *
                                                  0.3,
                                          child: Text(
                                            "Tanggal",
                                            style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                    color: Colors.black,
                                                    letterSpacing: .5,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          ),
                                        ),
                                        Container(
                                          width:
                                              (context.mediaQuery.size.width -
                                                      68) *
                                                  0.35,
                                          child: Text(
                                            "Jam",
                                            style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                    color: Colors.black,
                                                    letterSpacing: .5,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          ),
                                        ),
                                        Container(
                                          width:
                                              (context.mediaQuery.size.width -
                                                      68) *
                                                  0.35,
                                          child: Text(
                                            "Keterangan",
                                            style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                    color: Colors.black,
                                                    letterSpacing: .5,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 200,
                                        child: FutureBuilder(
                                          future: fetchAbsensi(),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              return ListView.builder(
                                                itemCount: snapshot.data.length,
                                                itemBuilder:
                                                    (BuildContext context,
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
                                                child:
                                                    CircularProgressIndicator());
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
                                margin: EdgeInsets.symmetric(vertical: 24),
                                width: double.infinity,
                                child: Text(
                                    "* Hubungi guru piket apabila ada kesalahan dalam absensi siswa",
                                    style: font.copyWith(
                                        fontSize: 10,
                                        color: Color(0xff969698)))),
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
          ),
        ],
      ),
    );
  }
}
