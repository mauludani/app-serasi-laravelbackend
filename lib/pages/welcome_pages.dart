part of 'pages.dart';

class WelcomePages extends StatefulWidget {
  final int initialPage;

  WelcomePages({this.initialPage = 0});
  @override
  _WelcomePagesState createState() => _WelcomePagesState();
}

class _WelcomePagesState extends State<WelcomePages> {
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: "FFFFFF".toColor(),
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          SafeArea(
              child: Container(
            color: 'FAFAFC'.toColor(),
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
              Center(
                child: Welcome1(),
              ),
              Center(
                child: Welcome2(),
              ),
              Center(
                child: Welcome3(),
              ),
              Center(
                child: LoginPages(),
              ),
            ],
          )),
          (selectedPage != 3)
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: Stack(
                    children: [
                      Container(
                        height: 50,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedPage = 3;
                                });
                                pageController.jumpToPage(selectedPage);
                              },
                              child: Text(
                                "Lewati",
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                    color: Colors.black26,
                                    letterSpacing: .5,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedPage = selectedPage + 1;
                                });
                                pageController.jumpToPage(selectedPage);
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Selanjuntnya",
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                        letterSpacing: .5,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.black,
                                    size: 14,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            (selectedPage == 0)
                                ? Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(4)))
                                : Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    width: 4,
                                    height: 4,
                                    decoration: BoxDecoration(
                                        color: "ACACAC".toColor(),
                                        borderRadius:
                                            BorderRadius.circular(2))),
                            (selectedPage == 1)
                                ? Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(4)))
                                : Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    width: 4,
                                    height: 4,
                                    decoration: BoxDecoration(
                                        color: "ACACAC".toColor(),
                                        borderRadius:
                                            BorderRadius.circular(2))),
                            (selectedPage == 2)
                                ? Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(4)))
                                : Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    width: 4,
                                    height: 4,
                                    decoration: BoxDecoration(
                                        color: "ACACAC".toColor(),
                                        borderRadius:
                                            BorderRadius.circular(2))),
                            (selectedPage == 3)
                                ? Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(4)))
                                : Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    width: 4,
                                    height: 4,
                                    decoration: BoxDecoration(
                                        color: "ACACAC".toColor(),
                                        borderRadius:
                                            BorderRadius.circular(2))),
                          ],
                        ),
                      ),
                    ],
                  ))
              : SizedBox()
        ],
      ),
    );
  }
}
