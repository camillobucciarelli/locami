import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

const authUser = functions
    .region("europe-west6")
    .auth
    .user;

const userRef = functions
    .region("europe-west6")
    .firestore
    .document("users/{userId}");

// Create user in firestore when a user created in firebase auth.
export const createUser = authUser().onCreate(async (user) => {
  const {uid, email, disabled} = user;

  const userRef = admin.firestore().collection("users").doc(uid);

  const data = {
    email,
    disabled,
    createdAt: admin.firestore.FieldValue.serverTimestamp(),
  };

  await userRef.set(data);
});

// Update user display name when user doc updated.
export const updateUser = userRef.onUpdate(async (change) => {
  const {uid, firstName, lastName} = change.after.data();

  await admin.auth().updateUser(uid, {
    displayName: `${firstName} ${lastName}`,
  });
});

// Delete user in firestore when a user updated in firebase auth.
export const deleteUser = authUser().onDelete(async (user) => {
  const {uid} = user;

  const userRef = admin.firestore().collection("users").doc(uid);

  await userRef.delete();
});
