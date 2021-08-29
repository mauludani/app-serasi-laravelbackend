part of 'pages.dart';

class Welcome2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
              width: double.infinity,
              height: context.mediaQuery.size.height * 0.5,
              color: Colors.white,
              child: Center(
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/Score.png"),
                          fit: BoxFit.cover)),
                ),
              )),
          Container(
            width: double.infinity,
            child: Center(
              child: Column(
                children: [
                  Text(
                    "Monitoring Nilai Lebih Mudah",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.black,
                          letterSpacing: .5,
                          fontSize: 22,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    width: 100,
                    height: 5,
                    color: "5F8B4D".toColor(),
                  ),
                  Row(
                    children: [
                      Container(
                          width: context.mediaQuery.size.width - 96,
                          margin: EdgeInsets.only(left: 48, right: 48, top: 24),
                          child: RichText(
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                text: "Monitoring nilai siswa dengan mudah di ",
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                    color: Colors.black87,
                                    letterSpacing: .5,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: "Serasi",
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      letterSpacing: .5,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ]),
                            textAlign: TextAlign.center,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
