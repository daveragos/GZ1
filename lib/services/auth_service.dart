// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class AuthService {
//   //google sign in
//   signInWithGoogle() async {
//     // begin the process of google sign in
//     final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
//     // obtain auth detail from request
//     final GoogleSignInAuthentication? gAuth = await gUser?.authentication;
//     // create a new credentials from the request
//     if (gAuth?.accessToken != null && gAuth?.idToken != null) {
//       final credential = GoogleAuthProvider.credential(
//         accessToken: gAuth?.accessToken,
//         idToken: gAuth?.idToken,
//       );

//       // finally, signing in with the new credentials
//       return FirebaseAuth.instance.signInWithCredential(credential);
//     }
//   }
// }
