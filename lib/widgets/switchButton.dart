import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:khome_app2/models/button_model.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton(
      {super.key, required this.buttonModel, required this.onChanged});

  final ButtonModel buttonModel;
  final void Function() onChanged;

  //final void Function(int) select;

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
              color: buttonModel.state
                  ? Color.fromARGB(255, 131, 180, 204)
                  : Color.fromARGB(113, 217, 216, 224),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
                  child: Container(
                      height: 50,
                      child: Image.asset(
                        'lib/icons/${buttonModel.image}.png',
                        color: buttonModel.state
                            ? Color(0xFCF6F5FF)
                            : Color.fromARGB(255, 131, 180, 204),
                      )),
                ),
                /*Icon(
                    icon,
                    size: 65,
                  ),*/
                Center(
                  child: Text(
                    buttonModel.name,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: buttonModel.state
                          ? Color(0xFCF6F5FF)
                          : Color.fromARGB(255, 131, 180, 204),
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
