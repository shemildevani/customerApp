class ApiRoutes {
  static String apiKey = ""; // if any
  static String serverURL =
      "https://dg-toa-be-yl6m.onrender.com";

  static String getPostURL = "$serverURL/googleLogin";

  static String getloginURL = "$serverURL/login";

  static String getSigninURL = "$serverURL/signup";

  static String updateUser = "$serverURL/";

  // change password

  static String requestOTP = "$serverURL/requestOTP";

  static String verifyOtp = "$serverURL/verifyOtp";

  static String setNewPassword = "$serverURL/setNewPassword";

  static String getUserByJwtToken = "$serverURL/getUserByJwtToken";

  static String getCategorydataURL = "$serverURL/category/treeStructure";

  static String getremedydataByCategoryIdURL = "$serverURL/remedy/findById/";

  static String addFavouriteURL = "$serverURL/favRemedy/create";

  static String removeFavouriteURL = "$serverURL/favRemedy/";

  static String getfavouriteURL = "$serverURL/favRemedy/getAll";

  static String getRemedybyIdURL = "$serverURL/remedy/";

  static String createRemedy = "$serverURL/remedy/create";

  static String getAllRemedyURL = "$serverURL/remedy/getAllRemedy";

  static String updateRemedyURL = "$serverURL/remedy/";

  static String createRemediesURL = "$serverURL/remedy/createMany";

  static String updateRemediesURL = "$serverURL/remedy/updateMany";

  static String deleteRemediesURL = "$serverURL/remedy/deleteMany";

  static String addFavouriteManyURL = "$serverURL/favRemedy/createMany";

  static String deleteFavouriteManyURL = "$serverURL/favRemedy/deleteMany";

  // patient

  static String createPatientURL = "$serverURL/patient/create";

  static String createPatientSymptomURL =
      '$serverURL/patients-information/create';

  static String deletePatientURL = '$serverURL/patient/delete/';

  static String deletePatientSymptomsURL =
      '$serverURL/patients-information/delete/';

  static String updatePatientURL = '$serverURL/patient/update/';

  static String updatePatientSymptomsURL =
      '$serverURL/patients-information/update/';

  static String getAllPatientURL = '$serverURL/patient/getAllPatient';

  static String getAllPatientSymptomsURL =
      '$serverURL/patients-information/getAll';

  static String createOfflinePatientsURL = '$serverURL/patient/createMany';

  static String createOfflinePatientsSymptomsURL =
      '$serverURL/patients-information/createMany';

  static String updateOfflinePatientsURL = '$serverURL/patient/updateMany';

  static String updateOfflinePatientsSymptomsURL =
      '$serverURL/patients-information/updateMany';

  static String deleteOfflinePatientsURL = '$serverURL/patient/deleteMany';

  static String deleteOfflinePatientsSymptomsURL =
      '$serverURL/patients-information/deleteMany';

  // Patient follow up
  static String createFollowUpURL = '$serverURL/patients-followup/create';

  static String updateFollowUpURL = '$serverURL/patients-followup/update/';

  static String deleteFollowUpURL = '$serverURL/patients-followup/delete/';

  static String getAllFollowUpURL =
      '$serverURL/patients-followup/user-followups';

  static String createOfflinePatientFollowUpsURL =
      '$serverURL/patients-followup/createMany';

  static String updateOfflinePatientFollowUpsURL =
      '$serverURL/patients-followup/updateMany';

  static String deleteOfflinePatientsFollowUpURL =
      '$serverURL/patients-followup/deleteMany';

  //  create personal Note

  static String getAllPersonalNotesURL = '$serverURL/personal-notes/getAll';

  static String createPersonalNoteURL = '$serverURL/personal-notes/create';

  static String createOfflinePersonalNoteURL =
      '$serverURL/personal-notes/createMany';

  static String deletePersonalNoteURL = '$serverURL/personal-notes/delete/';

  static String deleteOfflinePersonalNotesURL =
      '$serverURL/personal-notes/deleteMany';

  // subscription
  static String getPlanSubscriptionID =
      '$serverURL/subscriptions/getPlanSubscriptionID';

  static String getSubscriptionPlan = '$serverURL/subscriptions/getPlans';
}