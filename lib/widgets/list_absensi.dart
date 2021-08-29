part of 'widgets.dart';

class ListAbsensi extends StatelessWidget {
  final String tgl, status, jam;

  ListAbsensi(this.tgl, this.status, this.jam);
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: (context.mediaQuery.size.width - 68) * 0.3,
              child: Text(
                tgl,
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                  color: Colors.black,
                  letterSpacing: .5,
                  fontSize: 12,
                )),
              ),
            ),
            Container(
              width: (context.mediaQuery.size.width - 68) * 0.35,
              child: Text(
                jam,
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                  color: Colors.black,
                  letterSpacing: .5,
                  fontSize: 12,
                )),
              ),
            ),
            Container(
              width: (context.mediaQuery.size.width - 68) * 0.35,
              child: Text(
                status,
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                  color: Colors.black,
                  letterSpacing: .5,
                  fontSize: 12,
                )),
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        height: 1,
        color: Colors.grey[350],
      ),
    ]);
  }
}
