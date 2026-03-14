import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{
  final FirebaseAuth _auth=FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  // steam de connexion
Stream<User?> get authStateChange => _auth.authStateChanges();
// utilisateur current
User? get ciurrentUser => _auth.currentUser;

// inscription Email/password

Future <String?> register({
  required String email,
  required String password,
  required String displayName,

}) async {
  try{
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email.trim(),
       password: password,
       );
       await credential.user?.updateDisplayName(displayName.trim());
       return null; // null=succees

  }
  on FirebaseAuthException catch(e){
    print(e.code);
  }
}

// connexion avec email/password 

Future <String?> login ({
  required String email,
  required String password,

}) async{
  try{
     await _auth.signInWithEmailAndPassword
     (email: email.trim(), 
     password: password,
     );
     return null;
  }
  on FirebaseAuthException catch (e){
    print(e.code);
  }
}
// Mot de passe oublie 

Future <String?> SemndPassswordResed(String email) async{
  try{
    await _auth.sendPasswordResetEmail(email: email.trim());
    return null;
  }
  on FirebaseAuthException catch (e){
    print (e.code);
  }
}


// deconnexion 
Future <void> logout() async{
  await _auth.signOut();
}





}