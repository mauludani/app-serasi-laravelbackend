part of 'widgets.dart';

class ListNilai extends StatelessWidget {
  final String tgl, status;

  ListNilai(this.tgl, this.status);
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: (context.mediaQuery.size.width - 68) * 0.8,
              child: Text(
                tgl,
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                  color: Colors.black,
                  letterSpacing: .5,
                  fontSize: 14,
                )),
              ),
            ),
            Container(
              width: (context.mediaQuery.size.width - 68) * 0.2,
              child: Text(
                status,
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                  color: Colors.black,
                  letterSpacing: .5,
                  fontSize: 14,
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
