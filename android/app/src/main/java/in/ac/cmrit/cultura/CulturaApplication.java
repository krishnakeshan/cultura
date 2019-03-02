package in.ac.cmrit.cultura;

import com.parse.Parse;

import io.flutter.app.FlutterApplication;

public class CulturaApplication extends FlutterApplication {
    @Override
    public void onCreate() {
        super.onCreate();

        //initialize parse
        Parse.initialize(new Parse.Configuration.Builder(this)
                .server("http://35.237.58.159:1337/cultura")
                .applicationId("30e51261-39fe-42ec-a0d8-e75d242e5205")
                .enableLocalDataStore()
                .build());
    }
}
