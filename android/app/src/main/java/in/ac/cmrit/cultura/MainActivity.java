package in.ac.cmrit.cultura;

import android.os.Bundle;
import android.util.Log;

import com.parse.FindCallback;
import com.parse.LogInCallback;
import com.parse.LogOutCallback;
import com.parse.Parse;
import com.parse.ParseException;
import com.parse.ParseObject;
import com.parse.ParseQuery;
import com.parse.ParseUser;

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
                    //create query
                    ParseQuery<ParseObject> eventCategoriesQuery = ParseQuery.getQuery("EventCategory");
                    eventCategoriesQuery.findInBackground(new FindCallback<ParseObject>() {
                        @Override
                        public void done(List<ParseObject> objects, ParseException e) {
                            if (e == null) {
                                ObjectConverter objectConverter = new ObjectConverter();

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

                //method to get all events for a category
                else if (methodCall.method.equals("getEventsForCategory")) {
                    //get category id
                    String categoryId = methodCall.argument("categoryId");

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
                                Log.d("debugk", "logged in user " + user.getString("accountType"));
                                result.success(user.getString("accountType"));
                            }
                        }
                    });
                }

                //method to log out user
                else if (methodCall.method.equals("logOutUser")) {
                    //log out user and return status
                    ParseUser.logOutInBackground(new LogOutCallback() {
                        @Override
                        public void done(ParseException e) {
                            if (e == null) {
                                Log.d("DebugK", "Logged user out");
                                result.success(true);
                            }
                        }
                    });
                }

                //method to register a participant
                else if (methodCall.method.equals("registerParticipant")) {

                }
            }
        });
    }
}
