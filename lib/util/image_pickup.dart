import 'package:flutter/material.dart';

Future getImage(
    {BuildContext context,
      Function selectCamera,
      Function selectGallery,
      String param}) async {
  showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 16,
          child: Container(
            // decoration: DecorationBoxes.decorationSquareWithShadowWithNormalRadius(),
            // padding: EdgeInsets.all(20),
            height: 200,
            width: MediaQuery.of(context).size.width - 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Camera or Gallery?",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height:15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        selectCamera(param);
                        Navigator.pop(context);
                      },
                      child: new Image.asset('assets/camera_icon.png',
                        width:90,
                        height: 90,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        selectGallery(param);
                        Navigator.pop(context);
                      },
                      child: new Image.asset('assets/gallery_icon.png',
                        width: 90,
                        height: 90,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }).then((value) {
  });
}
