import {onDocumentCreated, onDocumentUpdated, onDocumentDeleted} from "firebase-functions/v2/firestore";
import * as admin from "firebase-admin";
import {Change, FirestoreEvent, DocumentSnapshot} from "firebase-functions/v2/firestore";

const REGION = "europe-west6";

interface UserData {
  uid: string;
  email?: string;
  disabled?: boolean;
  firstName?: string;
  lastName?: string;
  createdAt?: admin.firestore.FieldValue;
}

// Create user in firestore when a user document is created.
export const createUser = onDocumentCreated({region: REGION, document: "users/{userId}"}, async (event: FirestoreEvent<DocumentSnapshot | undefined, {userId: string}>) => {
  if (!event.data) {
    return;
  }
  const user = event.data.data() as UserData;
  const {uid, email, disabled} = user;

  // Note: This function now assumes that the client creates the user document
  // with the necessary fields (uid, email, disabled).
  // Additional logic might be needed if this assumption is incorrect.

  const userDocRef = admin.firestore().collection("users").doc(uid);

  const data: UserData = {
    uid, // ensure uid is always present
    email,
    disabled,
    createdAt: admin.firestore.FieldValue.serverTimestamp(),
  };

  await userDocRef.set(data, {merge: true}); // Use merge to avoid overwriting existing fields
});

// Update user display name when user doc updated.
export const updateUser = onDocumentUpdated({region: REGION, document: "users/{userId}"}, async (event: FirestoreEvent<Change<DocumentSnapshot> | undefined, {userId: string}>) => {
  if (!event.data || !event.data.after.exists) {
    return;
  }
  const userData = event.data.after.data() as UserData;
  const {uid, firstName, lastName} = userData;

  if (firstName && lastName) {
    await admin.auth().updateUser(uid, {
      displayName: `${firstName} ${lastName}`,
    });
  }
});

// Delete user in firestore when a user document is deleted.
export const deleteUser = onDocumentDeleted({region: REGION, document: "users/{userId}"}, async (event: FirestoreEvent<DocumentSnapshot | undefined, {userId: string}>) => {
  if (!event.data) {
    return;
  }
  const deletedUser = event.data.data() as UserData;
  const {uid} = deletedUser;

  // This will delete the corresponding Auth user.
  // Ensure this is the desired behavior.
  try {
    await admin.auth().deleteUser(uid);
    console.log(`Successfully deleted auth user ${uid}`);
  } catch (error) {
    console.error(`Error deleting auth user ${uid}:`, error);
  }
});
