package in.ac.cmrit.cultura;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;

import com.parse.FindCallback;
import com.parse.FunctionCallback;
import com.parse.GetCallback;
import com.parse.LogInCallback;
import com.parse.LogOutCallback;
import com.parse.Parse;
import com.parse.ParseCloud;
import com.parse.ParseException;
import com.parse.ParseObject;
import com.parse.ParseQuery;
import com.parse.ParseUser;
import com.parse.SaveCallback;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import in.ac.cmrit.cultura.helpers.ObjectConverter;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);

        //Set method channel
        new MethodChannel(getFlutterView(), "in.ac.cmrit.cultura/main").setMethodCallHandler(new MethodChannel.MethodCallHandler() {
            @Override
            public void onMethodCall(MethodCall methodCall, final MethodChannel.Result result) {
                //method to get all event categories
                if (methodCall.method.equals("getEventCategories")) {
                    //get an object converter
                    final ObjectConverter objectConverter = new ObjectConverter();

                    //first check offline
                    final ParseQuery<ParseObject> eventCategoriesQuery = ParseQuery.getQuery("EventCategory");
                    eventCategoriesQuery.fromPin("eventCategories");
                    eventCategoriesQuery.findInBackground(new FindCallback<ParseObject>() {
                        @Override
                        public void done(List<ParseObject> objects, ParseException e) {
                            if (e == null) {
                                //query executed, check if anything was found
                                if (!objects.isEmpty()) {
                                    //objects found offline, return these
                                    //create an array of compatible representations
                                    ArrayList<HashMap> categoryObjects = new ArrayList<>();
                                    for (ParseObject categoryObject : objects) {
                                        categoryObjects.add(objectConverter.parseObjectToMap(categoryObject));
                                    }

                                    //in the background get newer results from server
                                    eventCategoriesQuery.fromNetwork();
                                    eventCategoriesQuery.findInBackground(new FindCallback<ParseObject>() {
                                        @Override
                                        public void done(List<ParseObject> objects, ParseException e) {
                                            //query executed, now pin newer results for later use
                                            if (e == null) {
                                                ParseObject.pinAllInBackground("eventCategories", objects);
                                            }
                                        }
                                    });

                                    //return result
                                    result.success(categoryObjects);
                                }

                                //no objects found offline, get from server
                                else {

                                    eventCategoriesQuery.fromNetwork();
                                    eventCategoriesQuery.findInBackground(new FindCallback<ParseObject>() {
                                        @Override
                                        public void done(final List<ParseObject> objects, ParseException e) {
                                            if (e == null) {
                                                //got event categories from server, pin them
                                                ParseObject.pinAllInBackground("eventCategories", objects, new SaveCallback() {
                                                    @Override
                                                    public void done(ParseException e) {
                                                        if (e == null) {
                                                            //pinned, now return these
                                                            //create an array of compatible representations
                                                            ArrayList<HashMap> categoryObjects = new ArrayList<>();
                                                            for (ParseObject categoryObject : objects) {
                                                                categoryObjects.add(objectConverter.parseObjectToMap(categoryObject));
                                                            }

                                                            //return result
                                                            result.success(categoryObjects);
                                                        }
                                                    }
                                                });
                                            }
                                        }
                                    });
                                }
                            }
                        }
                    });
                }

                //method to get all events for a category
                else if (methodCall.method.equals("getEventsForCategory")) {
                    //get category id
                    String categoryId = methodCall.argument("categoryId");

                    //

                    //create query
                    ParseQuery<ParseObject> eventsQuery = ParseQuery.getQuery("Event");
                    eventsQuery.whereEqualTo("categoryId", categoryId);
                    eventsQuery.findInBackground(new FindCallback<ParseObject>() {
                        @Override
                        public void done(List<ParseObject> objects, ParseException e) {
                            if (e == null) {
                                ObjectConverter objectConverter = new ObjectConverter();

                                //create an array of compatible representations
                                ArrayList<HashMap> eventObjects = new ArrayList<>();
                                for (ParseObject categoryObject : objects) {
                                    eventObjects.add(objectConverter.parseObjectToMap(categoryObject));
                                }

                                //return result
                                result.success(eventObjects);
                            }
                        }
                    });
                }

                //method to login user
                else if (methodCall.method.equals("logInUser")) {
                    //get credentials
                    String username = methodCall.argument("username");
                    String password = methodCall.argument("password");

                    //log the user in
                    ParseUser.logInInBackground(username, password, new LogInCallback() {
                        @Override
                        public void done(ParseUser user, ParseException e) {
                            if (e == null) {
                                result.success(user.getString("accountType"));
                            }
                        }
                    });
                }

                //method to log out user
                else if (methodCall.method.equals("logOutUser")) {
                    //if there's a user logged in, log them out
                    if (ParseUser.getCurrentUser() != null) {
                        ParseUser.logOutInBackground(new LogOutCallback() {
                            @Override
                            public void done(ParseException e) {
                                //user logged out, return true
                                if (e == null) {
                                    result.success(true);
                                }

                                //error logging user out, return false
                                else result.success(false);
                            }
                        });
                    }

                    //there's no user logged in return false
                    else {
                        result.success(false);
                    }
                }

                //method to get logged in status
                else if (methodCall.method.equals("getVolunteerMode")) {
                    if (ParseUser.getCurrentUser() != null) {
                        result.success(true);
                    } else {
                        result.success(false);
                    }
                }

                //method to register a participant
                else if (methodCall.method.equals("registerParticipant")) {
                    //create params for calling cloud function
                    HashMap<String, Object> params = new HashMap<>();
                    params.put("receipt", methodCall.argument("receipt"));
                    params.put("name", methodCall.argument("name"));
                    params.put("phone", methodCall.argument("phone"));
                    params.put("email", methodCall.argument("email"));
                    params.put("eventId", methodCall.argument("eventId"));
                    params.put("eventName", methodCall.argument("eventName"));
                    params.put("college", methodCall.argument("college"));
                    params.put("volunteerId", ParseUser.getCurrentUser().getObjectId());
                    params.put("volunteerName", ParseUser.getCurrentUser().getString("name"));

                    //call cloud function
                    ParseCloud.callFunctionInBackground("registerParticipantForEvent", params, new FunctionCallback<Boolean>() {
                        @Override
                        public void done(Boolean object, ParseException e) {
                            //registration mostly went through, return status
                            if (e == null) {
                                //return status
                                result.success(object);
                            }

                            //registration not successful, return status
                            else {
                                result.success(false);
                            }
                        }
                    });
                }

                //method to open registration web link
                else if (methodCall.method.equals("openRegistrationLink")) {
                    String registrationLink = methodCall.argument("regLink");
                    Intent registerIntent = new Intent(Intent.ACTION_VIEW, Uri.parse(registrationLink));
                    startActivity(registerIntent);
                    result.success("done");
                }

                //method to open headliner link
                else if (methodCall.method.equals("openHeadlinerLink")) {
                    //get headliner registration link
                    ParseQuery<ParseObject> headlinerQuery = ParseQuery.getQuery("Headliner");
                    headlinerQuery.getFirstInBackground(new GetCallback<ParseObject>() {
                        @Override
                        public void done(ParseObject object, ParseException e) {
                            if (e == null) {
                                String link = object.getString("registrationLink");
                                Intent newIntent = new Intent(Intent.ACTION_VIEW, Uri.parse(link));
                                startActivity(newIntent);
                                result.success("done");
                            }
                        }
                    });
                }

                //method to get sponsors list
                else if (methodCall.method.equals("getSponsors")) {
                    ParseQuery<ParseObject> sponsorsQuery = ParseQuery.getQuery("Sponsor");
                    sponsorsQuery.findInBackground(new FindCallback<ParseObject>() {
                        @Override
                        public void done(List<ParseObject> objects, ParseException e) {
                            if (e == null) {
                                //found all sponsors, convert and return
                                ObjectConverter objectConverter = new ObjectConverter();
                                ArrayList<HashMap<String, Object>> sponsors = new ArrayList<>();

                                for (ParseObject sponsor : objects) {
                                    sponsors.add(objectConverter.parseObjectToMap(sponsor));
                                }

                                //return list
                                result.success(sponsors);
                            }
                        }
                    });
                }
            }
        });
    }
}
