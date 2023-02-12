import {registerNewAdmin, updateUserRoles} from "./user/user-roles";
import {createUser, deleteUser, updateUser} from "./user/user-listeners";

// Users
exports.updateUserRoles = updateUserRoles;
exports.registerNewAdmin = registerNewAdmin;
exports.createUser = createUser;
exports.updateUser = updateUser;
exports.deleteUser = deleteUser;
