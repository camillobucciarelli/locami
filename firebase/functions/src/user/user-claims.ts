import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

export type AdmittedRoles = "admin" | "developer" | "translator" | "user";

interface InputData {
  uid: string;
  roles: AdmittedRoles[];
}

// Callable function that set the user role to roles from the request.
export const updateUserRoles = functions.https.onCall(async (data: InputData, context) => {
  // Check if the user authenticated
  if (!context.auth) {
    throw new functions.https.HttpsError(
        "unauthenticated",
        "The function must be called while authenticated."
    );
  }

  // Check if the roles are valid
  if (!data.roles.every((role) => ["admin", "developer", "translator", "user"].includes(role))) {
    throw new functions.https.HttpsError(
        "invalid-argument",
        "Invalid roles provided."
    );
  }

  // Check if the user is an admin
  const user = await admin.auth().getUser(context.auth.uid);
  if (user.customClaims && !user.customClaims.roles.contains("admin")) {
    throw new functions.https.HttpsError(
        "permission-denied",
        "The function must be called by an admin."
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
    message: `Success! ${data.uid} has been assigned the following roles: ${data.roles}`,
  };
});
