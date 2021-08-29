part of 'shared.dart';

Widget loadingIndicator = SpinKitCircle(size: 45, color: Colors.blue);

// Color

Color biruColor = Color(0xff498FF8);
Color putihColor = Color(0xffFFFFFF);
LinearGradient mainBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xffFFFFFF), Color(0xffEFF2F7)]);

// NOTE: FONT WEIGHTS
FontWeight thin = FontWeight.w100;
FontWeight extraLight = FontWeight.w200;
FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;

// NOTE: TEXT STYLES
TextStyle font = GoogleFonts.poppins();

// Note: Shadows
BoxShadow shadow = BoxShadow(
  color: Colors.black.withOpacity(0.1),
  spreadRadius: 0,
  blurRadius: 10,
  offset: Offset(0, 0), // changes position of shadow
);

Widget buildBlur({
  @required Widget child,
  BorderRadius borderRadius,
  double sigmaX = 10,
  double sigmaY = 10,
}) =>
    ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
        child: child,
      ),
    );

Widget buildPelajaranCard(int index) => Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          boxShadow: [shadow],
          image: DecorationImage(
              image:
                  AssetImage('assets/${bgpelajaran(index)}'),
              fit: BoxFit.cover),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(9),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: SafeArea(
                  child: buildBlur(
                    borderRadius: BorderRadius.circular(9),
                    child: Container(
                      width: 139,
                      height: 70,
                      padding: EdgeInsets.all(10),
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(9)),
                      child: Text(
                        pelajaran(index),
                        style: font.copyWith(
                            fontSize: 14,
                            fontWeight: bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    String pelajaran(index) {
      String pelajaran;
      switch (index) {
        case 0:
        pelajaran = 'Bahasa Indonesia';
        break;
        case 1:
        pelajaran = 'Matematika';
        break;
        case 2:
        pelajaran = 'Bahasa Inggris';
        break;
        default:
        pelajaran = 'Olah Raga';
      }
      return pelajaran;
    }

    String bgpelajaran(index) {
      String pelajaran;
      switch (index) {
        case 0:
        pelajaran = 'bg (4).jpg';
        break;
        case 1:
        pelajaran = 'bg (1).jpg';
        break;
        case 2:
        pelajaran = 'bg (2).jpg';
        break;
        default:
        pelajaran = 'bg (3).jpg';
      }
      return pelajaran;
    }