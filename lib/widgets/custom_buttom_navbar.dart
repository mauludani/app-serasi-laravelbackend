part of 'widgets.dart';

class CustomButtomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onTap;

  CustomButtomNavBar({this.selectedIndex = 0, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: "ffffff".toColor(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              onTap(0);
            },
            child: Container(
                width: context.mediaQuery.size.width * 0.5,
                height: 20,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/home' +
                            ((selectedIndex == 0) ? '_selected.png' : '.png'),
                      ),
                      fit: BoxFit.contain),
                )),
          ),
          GestureDetector(
            onTap: () {
              onTap(1);
            },
            child: Container(
                width: context.mediaQuery.size.width * 0.5,
                height: 20,
                // margin: EdgeInsets.symmetric(horizontal: 83),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/nilai' +
                            ((selectedIndex == 1) ? '_selected.png' : '.png'),
                      ),
                      fit: BoxFit.contain),
                )),
          ),
        ],
      ),
    );
  }
}
