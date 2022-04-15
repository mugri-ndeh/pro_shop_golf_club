import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pro_shop_golf_club/models/user.dart';

enum AuthState {
  loggedIn,
  loggedOut,
  incomplete,
  codeSent,
  loading,
  finishedOnboard,
  fresh,
  login,
  signup,
}

class Authentication with ChangeNotifier {
  bool isLoading = false;
  final auth = FirebaseAuth.instance;
  UserModel? loggedUser;
  String? verificationCode;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late AuthState _loginState;
  get loginState => _loginState;

  Authentication() {
    init().then((value) {
      print('Login state is');
      print(_loginState);
    });
  }

  setAuthState(AuthState authState) {
    _loginState = authState;
    notifyListeners();
  }

  Future<void> init() async {
    _loginState = AuthState.loading;

    var firebaseuser = FirebaseAuth.instance.currentUser;
    loggedUser = (await returnUser());

    if (firebaseuser != null) {
      print('USER LOGED IN');
      if (loggedUser == null) {
        setAuthState(AuthState.incomplete);
        notifyListeners();
      } else {
        setAuthState(AuthState.loggedIn);
        notifyListeners();
      }
    } else {
      print('USER LOGGED OUT');
      setAuthState(AuthState.loggedOut);
      notifyListeners();
    }

    //_loginState = AuthState.Incomplete;
    // FirebaseAuth.instance.userChanges().listen((user) async {
    //   loggedUser = (await returnUser());

    //   if (user != null) {
    //     print('USER LOGED IN');
    //     if (loggedUser == null) {
    //       setAuthState(AuthState.Incomplete);
    //       notifyListeners();
    //     } else {
    //       setAuthState(AuthState.LoggedIn);
    //       notifyListeners();
    //     }
    //   } else {
    //     print('USER LOGGED OUT');
    //     setAuthState(AuthState.LoggedOut);
    //     notifyListeners();
    //   }
    //});
    // print(loggedUser!.email);
    // print(loggedUser!.username);
  }

  Future<UserModel?> login(
      String email, String password, BuildContext context) async {
    isLoading = true;
    notifyListeners();
    try {
      UserModel _user = UserModel();
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      _user.uid = userCredential.user!.uid;
      _loginState = AuthState.loggedIn;
      print('Success ${userCredential.user!.displayName}');
      loggedUser = _user;
      return _user;
    } on FirebaseAuthException catch (e) {
      print(e.message);

      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  UserModel? getUser(User? user) {
    return user == null ? null : UserModel(uid: user.uid);
  }

  Stream<UserModel?> onAuthStateChanged() {
    var auth = FirebaseAuth.instance;
    return auth.authStateChanges().map(getUser);
  }

  Future<UserModel?> register(String email, String username, String phone,
      String password, BuildContext context) async {
    try {
      UserModel _user = UserModel();
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      userCredential.user!.updateDisplayName(username);
      _user.uid = userCredential.user!.uid;
      _user.email = userCredential.user!.email!;
      _user.username = username;
      _user.phoneNumber = phone;
      _loginState = AuthState.loggedIn;
      loggedUser = _user;
      //UserDb().createUser(_user);
      print('Success ${userCredential.user!.displayName}');
      return _user;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Text(e.message!),
              ));
      return null;
    }
  }

  void logout() async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      await auth.signOut();
      setAuthState(AuthState.loggedOut);
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  Future<void> updateUsername(String username) async {
    try {
      User user = auth.currentUser!;
      user.updateDisplayName(username);
      // UserDb().updateUsername(user.uid, username);
      loggedUser = (await returnUser())!;
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> updatephone(String phone) async {
    try {
      User user = auth.currentUser!;
      // UserDb().updatePhone(user.uid, phone);
      loggedUser = (await returnUser())!;
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> addPurchase(List<String> purchases) async {
    try {
      User user = auth.currentUser!;
      // UserDb().addPurchase(user.uid, purchases);
      loggedUser = (await returnUser())!;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<UserModel?> returnUser() async {
    try {
      User user = auth.currentUser!;
      // return await UserDb().returnUser(user.uid);
    } catch (e) {
      print(e);
      print('Could not get data');
      return null;
    }
  }

  Future<void> signin(
    String phoneNum,
    BuildContext context,
  ) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNum,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            returnUser().then((value) {
              if (value == null) {
                setAuthState(AuthState.incomplete);
              } else {
                setAuthState(AuthState.loggedIn);
                // hideProgress();
              }
            });
          }).onError((error, stackTrace) => setAuthState(AuthState.loggedOut));
        },
        verificationFailed: (FirebaseAuthException e) {
          // hideProgress();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e.message.toString()),
              duration: const Duration(seconds: 3),
            ),
          );
        },
        codeSent: (String vID, int? resendToken) {
          // hideProgress();
          verificationCode = vID;
          setCode(vID);
          setAuthState(AuthState.codeSent);
          notifyListeners();
        },
        codeAutoRetrievalTimeout: (String vID) {
          verificationCode = vID;
        },
        timeout: const Duration(seconds: 60),
      );
    } on FirebaseAuthException catch (e) {
      print(e.message);
      // hideProgress();
    }
  }

  Future<String> loginWithCred(String vID, String smsCode) {
    var status = "";
    try {
      PhoneAuthCredential cred =
          PhoneAuthProvider.credential(verificationId: vID, smsCode: smsCode);
      FirebaseAuth.instance.signInWithCredential(cred).then((value) async {
        returnUser().then((value) {
          if (value == null) {
            setAuthState(AuthState.incomplete);
          } else {
            setAuthState(AuthState.loggedIn);
          }
        });
      }).onError((error, stackTrace) => setAuthState(AuthState.loggedOut));
      return Future.value(status);
    } on FirebaseAuthException catch (exception, s) {
      // hideProgress();
      return Future.value(exception.message);
    } catch (e, s) {
      debugPrint(e.toString() + '$s');
      status = 'Login failed, Please try again.';
      // hideProgress();
      return Future.value(status);
    }
  }

  setCode(String code) {
    verificationCode = code;
  }
}
