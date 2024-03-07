import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return; // User canceled sign-in

      // You can access user details like this:
      // print(googleUser.displayName);
      // print(googleUser.email);

      // After getting user details, you can navigate to the next screen or do any other actions.
    } catch (error) {
      print('Error signing in with Google: $error');
    }
  }
}
class AuthenticationController extends GetxController {
  // Assuming you have a method to get the user details from your authentication service
  Future<UserDetails> getUserDetails() async {
    // Logic to get user details
    // Replace this with your actual implementation
    return UserDetails(
      name: 'John Doe',
      email: 'john.doe@example.com',
      // Other user details
    );
  }
}

class UserDetails {
  final String name;
  final String email;

  UserDetails({required this.name, required this.email});
}

