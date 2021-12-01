import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hey_istanbullum/views/location/location_detail_view.dart';

class FavoriteCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LocationDetail()));
      },
      onLongPress: () {
        _onLongPressed(context);
      },
      leading: const Icon(Icons.pin_drop, color: Colors.red),
      title: const Text('Ispark'),
      subtitle: const Text('Kadıköy rıhtım ispark'),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            '40.12312',
            style: TextStyle(fontSize: 12),
          ),
          Text(
            '40.12312',
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  _onLongPressed(context) {
    return showCupertinoModalPopup(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return CupertinoActionSheet(
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "Iptal",
              style: TextStyle(color: Colors.blue),
            ),
          ),
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {},
              child: const Text("Favorilerimden Kaldır",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
