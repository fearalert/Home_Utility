import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import '../main.dart';

class Database {
  void addProsInfo({User user, Map proData}) {
    prosRefrence.child(user.uid).set(proData);
  }

  Future<Map> getProsInfo() async {
    Map prosData = {
      // 'uid': uid,
    };
    await prosRefrence.child(userAuthentication.userID).once().then(
      (DataSnapshot snapshot) {
        Map.from(snapshot.value).forEach(
          (key, value) {
            if (key == 'prosName') {
              prosData['prosName'] = value;
            }
            if (key == 'prosPhoneNo') {
              prosData['prosPhoneNo'] = value;
            }
          },
        );
      },
    );
    // print(prosData);
    return prosData;
  }

  void deleteRequest(String requestKey) {
    String userID = userAuthentication.userID;
    requestRefrence.child(requestKey).remove();
  }

  Future<Query> requestQuery({String category}) async {
    // return requestRefrence.child(prosProfessionValue).orderByChild(requestKey);
    return requestRefrence
        .child(category)
        .orderByChild('category')
        .equalTo(prosProfessionValue);
  }

  Stream userRequestsStream() {
    // print(category);
    if (category == '') return null;
    return requestRefrence.child(category).onValue;
  }

  Future<String> get prosProfession async {
    String profession;
    String userID = userAuthentication.userID;
    print(userID);
    await prosRefrence.child(userID).once().then((value) {
      Map.from(value.value).forEach((key, value) {
        if (key == 'profession') {
          profession = value;
        }
      });
    });
    return profession;
  }

  void updateProfession(String profession) {
    String userID = userAuthentication.userID;
    prosRefrence.child(userID).update({
      'profession': profession,
    });
  }

  Future<bool> checkAccount(User user) async {
    bool accountExists = false;
    await prosRefrence.child(user.uid).once().then((DataSnapshot snapshot) {
      if (snapshot.value != null)
        accountExists = true;
      else
        accountExists = false;
    });
    return accountExists;
  }

  Future<bool> checkPhoneNumber(int phoneNo) async {
    bool isAlreadyUsed = true;
    print(phoneNo);
    Query query = prosRefrence.orderByChild('prosPhoneNo').equalTo(phoneNo);
    await query.once().then((DataSnapshot snapshot) {
      if (snapshot.value != null)
        isAlreadyUsed = true;
      else
        isAlreadyUsed = false;
    });
    return isAlreadyUsed;
  }

  Future<void> changeState(
      {String userID, String category, String requestKey, String state}) async {
    Map info = await getProsInfo();
    final reqRef =
        requestRefrence.child(category).child(requestKey).child('state');
    final userRef = usersRefrence
        .child(userID)
        .child('requests')
        .child(requestKey)
        .child('state');
    if (state == 'accepted') {
      info['state'] = state;
      await reqRef.set(info);
      await userRef.set(info);
    } else {
      await reqRef.set(
        {
          'state': state,
          // 'proInfo': userID,
        },
      );
      await userRef.set(
        {
          'state': state,
          // 'proInfo': userID,
        },
      );
    }
  }

  Future<void> saveRequestAsJob({String requestKey}) async {
    DataSnapshot snapshot =
        await requestRefrence.child(category).child(requestKey).once();

    Map requestInfo = snapshot.value;
    String userID = userAuthentication.userID;
    // print(requestInfo);
    // print(userID);
    DatabaseReference ref = prosRefrence.child(userID).child('jobs');
    ref.child(requestKey).set(requestInfo);
  }

  Future<void> deleteJob({String requestKey}) async {
    prosRefrence
        .child(userAuthentication.userID)
        .child('jobs')
        .child(requestKey)
        .remove();
  }

  Stream acceptedRequestStream() {
    return prosRefrence.child(userAuthentication.userID).child('jobs').onValue;
  }
}
