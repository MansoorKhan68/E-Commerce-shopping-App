// Import the necessary packages
import 'package:cloud_firestore/cloud_firestore.dart'; // Firebase Firestore for storing user data
import 'package:complain_management_system/models/user_model.dart'; // User model for storing user information
import 'package:complain_management_system/screens/user_panel/main_screen.dart'; // Screen to navigate after successful login
import 'package:firebase_auth/firebase_auth.dart'; // Firebase Authentication for handling user sign-in
import 'package:flutter_easyloading/flutter_easyloading.dart'; // For showing loading indicators
import 'package:get/get.dart'; // GetX for state management and navigation
import 'package:google_sign_in/google_sign_in.dart'; // Google Sign-In package to handle Google login

// GoogleSignInController manages Google Sign-In functionality using GetX for state management
class GoogleSignInController extends GetxController {
  
  // Step 1: Create an instance of the GoogleSignIn class.
  // This object is used to initiate the Google sign-in process.
  final GoogleSignIn googleSignIn = GoogleSignIn();

  // Step 2: Create an instance of FirebaseAuth.
  // This object helps us authenticate users with Firebase after signing in with Google.
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Step 3: Create a function to handle the Google Sign-In process.
  // The function is asynchronous because we are waiting for responses from Google and Firebase.
  Future<void> signInWithGoogle() async {
    try {
      // Step 4: Start the Google sign-in process by opening the Google Sign-In UI.
      // This shows the Google account selection screen to the user.
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

      // Step 5: Check if the user successfully signed in.
      // If the user canceled the login (e.g., by closing the sign-in screen), googleSignInAccount will be null.
      if (googleSignInAccount != null) {
        // Step 6: Show a loading indicator to let the user know the sign-in is in progress.
        EasyLoading.show(status: 'Please Wait...');

        // Step 7: After the user selects their Google account, we need to authenticate it.
        // This gets Google's authentication tokens like accessToken and idToken for Firebase authentication.
        GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

        // Step 8: Use the tokens from Google to create a Firebase credential.
        // This credential will allow us to sign in to Firebase using the Google account.
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken, // Access token from Google
          idToken: googleSignInAuthentication.idToken, // ID token from Google
        );

        // Step 9: Sign in to Firebase with the Google credential.
        // Firebase will authenticate the user using the provided Google credentials.
        final UserCredential userCredential = await _auth.signInWithCredential(credential);

        // Step 10: Get the user object from the UserCredential.
        // The user object contains information like the user's email, name, profile picture, etc.
        final User? user = userCredential.user;

        // If the user is successfully authenticated, proceed with further actions.
        if (user != null) {
          // Step 11: Create a new user model object with the user's data.
          // This will be used to store the user's details in Firebase Firestore.
          UserModel userModel = UserModel(
            uId: user.uid, // Unique ID provided by Firebase for the user
            username: user.displayName.toString(), // User's name from Google
            email: user.email.toString(), // User's email from Google
            phone: user.phoneNumber.toString(), // User's phone number (if available)
            userImg: user.photoURL.toString(), // User's profile picture URL
            userDeviceToken: '', // Placeholder for device token (can be used for push notifications later)
            country: '', // Placeholder for user's country (can be filled later)
            userAddress: '', // Placeholder for user's address
            street: '', // Placeholder for street name
            isAdmin: false, // Whether the user is an admin (default to false)
            isActive: true, // Whether the user's account is active (default to true)
            createdOn: DateTime.now(), // Timestamp when the user was created
            city: '', // Placeholder for user's city
          );

          // Step 12: Save the user's information in Firebase Firestore under the "users" collection.
          // The document ID is the user's unique Firebase ID (user.uid).
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .set(userModel.toMap());

          // Step 13: Dismiss the loading indicator after the user is successfully signed in.
          EasyLoading.dismiss();

          // Step 14: Navigate the user to the main screen of the app.
          Get.to(() => const MainScreen());
        }
      }
    } catch (e) {
      // Step 15: Dismiss the loading indicator if an error occurs during the sign-in process.
      EasyLoading.dismiss();

      // Step 16: Print the error message to the console for debugging purposes.
      print("Error during Google Sign-In: $e");
    }
  }
}
