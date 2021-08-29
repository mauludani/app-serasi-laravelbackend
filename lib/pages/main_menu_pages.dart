part of 'pages.dart';

class MainMenuPages extends StatefulWidget {
  final int initialPage;

  const MainMenuPages({Key key, this.initialPage = 0}) : super(key: key);

  @override
  _MainMenuPagesState createState() => _MainMenuPagesState();
}

class _MainMenuPagesState extends State<MainMenuPages> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedPage = 0;

  PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    selectedPage = widget.initialPage;
    pageController = PageController(initialPage: widget.initialPage);
  }

  @override
  Widget build(BuildContext context) {
    // String nama =
    //     (context.read<UserCubit>().state as UserLoaded).user.nama.toUpperCase();
    return Scaffold(
      drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.white,
          ),
          child: Drawer(child: MySidebar())),
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.0),
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
              Container(
                  color: Color(0xffFFFFFF),
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(
                            width: context.mediaQuery.size.width * .5 - 36,
                            height: 35),
                        child: ElevatedButton.icon(
                          label: Text(
                            'MENU',
                            style: (selectedPage == 0)
                                ? GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: .5,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700))
                                : GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        letterSpacing: .5,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700)),
                          ),
                          icon: Icon(
                            Icons.apps,
                            size: 12,
                          ),
                          onPressed: () {
                            setState(() {
                              selectedPage = 0;
                            });
                            pageController.jumpToPage(selectedPage);
                          },
                          style: (selectedPage == 0)
                              ? ElevatedButton.styleFrom(
                                  primary: biruColor,
                                  alignment: Alignment.centerLeft,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9),
                                  ))
                              : ButtonStyle(
                                  alignment: Alignment.centerLeft,
                                  foregroundColor: MaterialStateProperty.all(
                                      "5A5A5A".toColor()),
                                  overlayColor: MaterialStateProperty.all(
                                      "DED1D1".toColor()),
                                  backgroundColor: MaterialStateProperty.all(
                                      "F2F2F2".toColor()),
                                  elevation: MaterialStateProperty.all(0),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9),
                                  ))),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(
                            width: context.mediaQuery.size.width * .5 - 36,
                            height: 35),
                        child: ElevatedButton.icon(
                          label: Text(
                            'PEMBERITAHUAN',
                            maxLines: 1,
                            style: (selectedPage == 0)
                                ? GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        color: "5A5A5A".toColor(),
                                        letterSpacing: .5,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700))
                                : GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: .5,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700)),
                          ),
                          icon: Icon(
                            Icons.notifications,
                            size: 12,
                          ),
                          onPressed: () {
                            setState(() {
                              selectedPage = 1;
                            });
                            pageController.jumpToPage(selectedPage);
                          },
                          style: (selectedPage == 0)
                              ? ButtonStyle(
                                  alignment: Alignment.centerLeft,
                                  foregroundColor: MaterialStateProperty.all(
                                      "5A5A5A".toColor()),
                                  overlayColor: MaterialStateProperty.all(
                                      "DED1D1".toColor()),
                                  backgroundColor: MaterialStateProperty.all(
                                      "F2F2F2".toColor()),
                                  elevation: MaterialStateProperty.all(0),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9),
                                  )))
                              : ElevatedButton.styleFrom(
                                  primary: biruColor,
                                  alignment: Alignment.centerLeft,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9),
                                  )),
                        ),
                      ),
                    ],
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
              child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                selectedPage = index;
              });
            },
            children: [
              Center(child: HomePages()),
              Center(
                child: NotificationsPages(),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
