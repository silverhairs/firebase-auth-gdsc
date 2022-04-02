import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

///  A class that manages the state of [user].
///
/// This class is a subclass of [ChangeNotifier] which does logic operations
/// then notifies all the listeners that are listening to its [user].
class UserChangeNotifier extends ChangeNotifier {
  // This variable is private because we do not want other objects to update the
  // variable without notifying the listeners. For example if we update the
  // value of _user to `null` the variable will be updated but the listeners will
  // not be aware of the new value. Everytime we update this value, we should
  // notify the listeners trhough the `notifyListeners()` method.
  User? _user;

  /// The user available in this notifier.
  // We are exposing this as a getter because a getter does not updates a value.
  // it only reads the value; and that's exactly what we want because as said in
  // the explanation for `_user` we don't want the user to update the user
  // variable without notifying the listeners.
  User? get user => _user;

  /// Passes [newUser] as the new value of [user] then notifies the listeners
  /// about the change.
  void updateUser(User newUser) {
    _user = newUser;
    notifyListeners();
  }

  /// This function deletes the existing value of [user] by setting it to `null`
  /// then notifies the listeners about the change.
  void logOut() {
    _user = null;
    notifyListeners();
  }
}


// Changer -> is a ChangeNotifier (UserChangeNotifier).

// Listener will be Consumer(provider) or a ValueListenableBuilder(not provider)
