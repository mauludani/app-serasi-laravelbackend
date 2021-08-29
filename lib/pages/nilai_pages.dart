part of 'pages.dart';

class NilaiPages extends StatefulWidget {
  const NilaiPages({Key key}) : super(key: key);

  @override
  _NilaiPagesState createState() => _NilaiPagesState();
}

class _NilaiPagesState extends State<NilaiPages> {
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
                        pageBuilder: (a, b, c) => NilaiPages(),
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
                                child: Text("Nilai",
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
                                        color: biruColor),
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
                                                      BorderRadius.circular(9),),
                                              child: Image(
                                                image: AssetImage(
                                                    'assets/icon3.png'),
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width:
                                                context.mediaQuery.size.width -
                                                    132,
                                            child: Text(
                                                "Tidak Ada Pengumuman",
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
                                child: Text("Daftar Pelajaran",
                                    style: font.copyWith(
                                        fontWeight: bold, fontSize: 16))),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              width: double.infinity,
                              height: 400,
                              child: StaggeredGridView.countBuilder(
                                staggeredTileBuilder: (index) =>
                                    StaggeredTile.count(
                                        2, index.isEven ? 2.5 : 2),
                                mainAxisSpacing: 14,
                                crossAxisSpacing: 14,
                                crossAxisCount: 4,
                                itemCount: 4,
                                itemBuilder: (context, index) =>
                                    buildPelajaranCard(index),
                              ),
                            )
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


