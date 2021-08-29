part of 'pages.dart';

class Dashboard2 extends StatefulWidget {
  @override
  _Dashboard2State createState() => _Dashboard2State();
}

class _Dashboard2State extends State<Dashboard2> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String nama = "";
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    nama = sp.getString("name") ?? 'nama';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.white,
          ),
          child: Drawer(child: MySidebar())),
      backgroundColor: "F4F4F5".toColor(),
      body: ListView(
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
                          nama,
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
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 24),
                        child: Text(
                          "Nilai Hasil Semester Ganjil 2021",
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  letterSpacing: .5,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700)),
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 24),
                        child: Text(
                          "Bahasa Indonesia",
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  color: "5B5B82".toColor(),
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
                              offset:
                                  Offset(0, 6), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
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
                                            0.8,
                                    child: Text(
                                      "Nama",
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
                                            0.2,
                                    child: Text(
                                      "GRADE",
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
                            ListNilai(
                                "TUGAS 1",
                                (context.read<NilaiCubit>().state
                                        as NilaiLoaded)
                                    .nilais
                                    .tugas1
                                    .toString()),
                            ListNilai(
                                "TUGAS 2",
                                (context.read<NilaiCubit>().state
                                        as NilaiLoaded)
                                    .nilais
                                    .tugas2
                                    .toString()),
                            ListNilai(
                                "TUGAS 3",
                                (context.read<NilaiCubit>().state
                                        as NilaiLoaded)
                                    .nilais
                                    .tugas3
                                    .toString()),
                            ListNilai(
                                "UTS",
                                (context.read<NilaiCubit>().state
                                        as NilaiLoaded)
                                    .nilais
                                    .uts
                                    .toString()),
                            ListNilai(
                                "UAS",
                                (context.read<NilaiCubit>().state
                                        as NilaiLoaded)
                                    .nilais
                                    .uas
                                    .toString()),
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 15),
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "Detail Nilai",
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: .5,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700)),
                            ))),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      width: double.infinity,
                      child: Text(
                        "* Hubungi guru mata pelajaran terkait apabila ada nilai yang tidak sesuai",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                color: "969698".toColor(),
                                letterSpacing: .5,
                                fontSize: 12,
                                fontWeight: FontWeight.w700)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
