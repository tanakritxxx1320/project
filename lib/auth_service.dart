import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  //register
  Future<void> signUpWithEmail(
      String email, String password, String name, String tel) async {
    try {
      // Create New User Account to Firebase Authen
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final uid = credential.user!.uid;
      print(uid);

      // Store User infomation (name, tel) to FireStore
      FirebaseFirestore.instance.collection("Users").doc(uid).set({
        "name": name,
        "tel": tel,
        
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    
  }




  //login
  static Future<int> loginUser(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print("Successful");
      return 1;
    } on FirebaseAuthException catch (e) {
      print("Failed");
      print(e.code);

      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return 2;
    } catch (e) {
      print(e);
    }
    return 0;
  }

  // logout
  static Future<void> logOutUser() async {
    await FirebaseAuth.instance.signOut();
  }

  fieldbo(String text, String text2, String text3, String text4) {}
  //google login
}

class GoogleAuthService {
  Future<void> singinwithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      print('succes');
    } catch (err) {
      print(err);
    }
  }

  void googleSingOut() {
    GoogleSignIn().signOut();
  }
}

//booking field
class Registercat{
  Future<void> catregister(String catname, String cattype, String catgender, String catAge) async {
    try {
      // Get current user from FirebaseAuth
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        // Handle case where there is no current user
        throw Exception('No current user');
      }
      
      // Store User information (name, tel) to Firestore
      await FirebaseFirestore.instance.collection("Catregister").doc(user.uid).set({
        "CatName": catname,
        "Cattype": cattype,
        "Gender": catgender,
        "Age": catAge,
      });
      print("Booking successful");
    } catch (e) {
      print("Error booking: $e");
      // Handle error here
    }
  }
}


  
