import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
import {getFirestore} from "firebase-admin/lib/firestore";

// Create user in firestore when a user is created in firebase auth
export const createUser = functions.auth.user().onCreate(async (user) => {
  const {uid, email, displayName, disabled} = user;

  const userRef = getFirestore().collection("users").doc(uid);

  const data = {
    email,
    displayName,
    disabled,
    createdAt: admin.firestore.FieldValue.serverTimestamp(),
  };

  await userRef.set(data);
});

// Delete user in firestore when a user is updated in firebase auth
export const deleteUser = functions.auth.user().onDelete(async (user) => {
  const {uid} = user;

  const userRef = getFirestore().collection("users").doc(uid);

  await userRef.delete();
}
);
