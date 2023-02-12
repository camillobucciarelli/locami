import {createUser, deleteUser, updateUser} from "./user/user-listeners";
import * as admin from "firebase-admin";

admin.initializeApp();

// Users
exports.createUser = createUser;
exports.updateUser = updateUser;
exports.deleteUser = deleteUser;
