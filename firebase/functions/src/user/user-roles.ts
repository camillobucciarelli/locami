import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

export enum UserRoles {
  admin = "admin",
  developer = "developer",
  translator = "translator",
  user = "user"
}

export interface InputData {
  uid: string;
  roles: UserRoles[];
}

// Callable function that set the user role to roles from data.
export const updateUserRoles = functions.https.onCall(async (data: InputData, context) => {
  // Check if the user authenticated
  if (!context.auth) {
    throw new functions.https.HttpsError(
        "unauthenticated",
        "The function must be called while authenticated."
    );
  }

  // Check if the token is valid and if the user is administrator.
  let customClaims;
  try {
    customClaims = await admin.auth().verifyIdToken(context.auth.token.uid);
  } catch (e) {
    throw new functions.https.HttpsError(
        "permission-denied",
        "The function must be called while authenticated."
    );
  }
  if (!customClaims || !customClaims.roles.contains("admin")) {
    throw new functions.https.HttpsError(
        "permission-denied",
        "The function must be called by an admin."
    );
  }

  // Check if the roles are valid
  if (!data.roles.every((role) => role in UserRoles)) {
    throw new functions.https.HttpsError(
        "invalid-argument",
        "Invalid roles provided."
    );
  }

  // Check if the user exists
  const userToChange = await admin.auth().getUser(data.uid);
  if (!userToChange) {
    throw new functions.https.HttpsError(
        "not-found",
        "The user does not exist."
    );
  }

  // Get the user and add the custom claim
  await admin.auth().setCustomUserClaims(data.uid, {
    roles: data.roles,
  });

  // Return the user data
  return {
    uid: data.uid,
    roles: data.roles,
  };
});

// Callable function that registers a new administrator.
export const registerNewAdmin = functions.https.onCall(async (data, context) => {
  // Check if the user authenticated
  if (!context.auth) {
    throw new functions.https.HttpsError(
        "unauthenticated",
        "The function must be called while authenticated."
    );
  }

  // register new user with email and password
  const user = await admin.auth().createUser({
    email: data.email,
    password: data.password,
    displayName: data.displayName,
  });

  // Set claims to administrator
  await admin.auth().setCustomUserClaims(user.uid, {
    roles: [UserRoles.admin],
  });

  return {
    uid: user.uid,
  };
});
