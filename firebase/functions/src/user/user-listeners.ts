import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

// Create user in firestore when a user created in firebase auth.
export const createUser = functions.auth.user().onCreate(async (user) => {
  const {uid, email, displayName, disabled} = user;

  const userRef = admin.firestore().collection("users").doc(uid);

  const data = {
    email,
    displayName,
    disabled,
    createdAt: admin.database.ServerValue.TIMESTAMP,
  };

  await userRef.set(data);
});

// Update user in firestore when a user updated in firebase auth.
export const updateUser = functions.auth.user().beforeSignIn(async (change) => {
  const {uid, email, displayName, disabled} = change;

  const userRef = admin.firestore().collection("users").doc(uid);

  const data = {
    email,
    displayName,
    disabled,
    updatedAt: admin.database.ServerValue.TIMESTAMP,
  };

  await userRef.update(data);
});

// Delete user in firestore when a user updated in firebase auth.
export const deleteUser = functions.auth.user().onDelete(async (user) => {
  const {uid} = user;

  const userRef = admin.firestore().collection("users").doc(uid);

  await userRef.delete();
}
);
