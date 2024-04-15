import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    required this.ind,
    required this.select,
  });

  final int ind;
  final void Function(int) select;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFCF6F5FF),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: GNav(
            selectedIndex: ind,
            onTabChange: (index) {
              select(index);
            },
            gap: 8,
            backgroundColor: Color(0xFCF6F5FF),
            color: Color.fromARGB(255, 131, 180, 204),
            activeColor: Color(0xFCF6F5FF),
            tabBackgroundColor: Color.fromARGB(255, 131, 180, 204),
            padding: EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.home_filled,
                text: 'Główny',
              ),
              GButton(
                icon: Icons.tv_rounded,
                text: 'Salon',
              ),
              GButton(
                icon: Icons.bed,
                text: 'Sypialnia',
              ),
              GButton(
                icon: Icons.garage_outlined,
                text: 'Garaż',
              )
            ]),
      ),
    );
  }
}
