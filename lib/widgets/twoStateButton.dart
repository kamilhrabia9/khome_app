import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:khome_app2/models/button2state_model.dart';

class TwoStateButton extends StatelessWidget {
  const TwoStateButton({super.key, required this.btn, required this.onChanged});

  final btn2stateModel btn;
  final void Function() onChanged;

  //final void Function(int) select;

  Color ButtonBackground(int colorState) {
    Color tempColor;

    switch (colorState) {
      case 0:
        tempColor = Color.fromARGB(113, 217, 216, 224);
        break;
      case 1:
        tempColor = Color.fromARGB(255, 131, 180, 204);
        break;
      case 2:
        tempColor = Color.fromARGB(113, 217, 216, 224);
        break;
      case 3:
        tempColor = Color.fromARGB(255, 131, 180, 204);
        break;
      default:
        tempColor = Color.fromARGB(113, 217, 216, 224);
        break;
    }
    return tempColor;
  }

  Image ImageButton(int imageState) {
    String tempPath = '';
    Color tempColor = Color.fromARGB(255, 131, 180, 204);

    if (imageState == 0 || imageState == 2) {
      tempColor = Color.fromARGB(255, 131, 180, 204);
    }
    if (imageState == 1 || imageState == 3) {
      tempColor = Color(0xFCF6F5FF);
    }

    if (imageState < 2) {
      tempPath = btn.imageLocked;
    }
    if (imageState >= 2) {
      tempPath = btn.imageOpen;
    }

    return Image.asset('lib/icons/$tempPath.png', color: tempColor);
  }

  Color TextColor(int colorState) {
    Color tempColor;

    switch (colorState) {
      case 0:
        tempColor = Color.fromARGB(255, 131, 180, 204);
        break;
      case 1:
        tempColor = Color(0xFCF6F5FF);
        break;
      case 2:
        tempColor = Color.fromARGB(255, 131, 180, 204);
        break;
      case 3:
        tempColor = Color(0xFCF6F5FF);
        break;
      default:
        tempColor = Color.fromARGB(255, 131, 180, 204);
        break;
    }
    return tempColor;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
            height: 100,
            width: 90,
            decoration: BoxDecoration(
              color: ButtonBackground(btn.state),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
                  child: Container(
                    height: 50,
                    child: ImageButton(btn.state),
                    // color: TextColor(btn.state),
                  ),
                ),

                /*Icon(
                    icon,
                    size: 65,
                  ),*/
                Center(
                  child: Text(
                    btn.name,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: TextColor(btn.state),
                    ),
                  ),
                  /* CupertinoSwitch(
                        value: false,
                        onChanged: (value) {},
                      )*/
                ),
              ],
            )),
      ),
    );
  }
}
