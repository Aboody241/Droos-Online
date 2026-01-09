import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

admin.initializeApp();

// Define the expected data structure
interface CreateStudentData {
  email: string;
  password: string;
  name: string;
}

exports.createStudent = functions.https.onCall(async (request: functions.https.CallableRequest<CreateStudentData>) => {
  const data = request.data;
  const context = request;

  // 🔐 لازم Admin يكون مسجل دخول
  if (!context.auth) {
    throw new functions.https.HttpsError(
      "unauthenticated",
      "User not authenticated"
    );
  }

  // 🔐 التأكد إنه Admin
  const adminDoc = await admin
    .firestore()
    .collection("users")
    .doc(context.auth.uid)
    .get();

  const adminData = adminDoc.data();
  if (!adminDoc.exists || !adminData || adminData.role !== "admin") {
    throw new functions.https.HttpsError(
      "permission-denied",
      "Only admin can create students"
    );
  }

  const { email, password, name } = data;

  // 1️⃣ Create Auth User
  const userRecord = await admin.auth().createUser({
    email,
    password,
  });

  // 2️⃣ Create Firestore doc
  await admin.firestore().collection("users").doc(userRecord.uid).set({
    name,
    email,
    role: "student",
    createdAt: admin.firestore.FieldValue.serverTimestamp(),
  });

  return { success: true };
});

