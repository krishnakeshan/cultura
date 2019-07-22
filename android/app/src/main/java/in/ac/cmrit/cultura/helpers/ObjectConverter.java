package in.ac.cmrit.cultura.helpers;

import com.parse.ParseGeoPoint;
import com.parse.ParseObject;

import java.util.Date;
import java.util.HashMap;

public class ObjectConverter {
    //method to convert a parse object to a compatible representation
    public HashMap<String, Object> parseObjectToMap(ParseObject parseObject) {
        HashMap<String, Object> result = new HashMap<>();

        result.put("objectId", parseObject.getObjectId());
        result.put("createdAt", parseObject.getCreatedAt().toString());

        for (String key : parseObject.keySet()) {
            Object attribute = parseObject.get(key);

            result.put(key, attribute);
        }

        return result;
    }

    //method to convert any basic value to a compatible type
    public Object getCompatibleRepresentation(Object object) {
        //attribute is of type String
        if  (object.getClass() == String.class) {
            return (String) object;
        }

        //attribute is of type Number
        else if (object.getClass() == Number.class) {
            return (Number) object;
        }

        //attribute is a Boolean
        else if (object.getClass() == Boolean.class) {
            return (Boolean) object;
        }

        //attribute is date
        else if (object.getClass() == Date.class) {
            return ((Date) object).toString();
        }

        //attribute is ParseGeoPoint
        else if (object.getClass() == ParseGeoPoint.class) {
            HashMap<String, Double> point = new HashMap<>();
            point.put("lat", ((ParseGeoPoint) object).getLatitude());
            point.put("lon", ((ParseGeoPoint) object).getLongitude());
            return point;
        }

        //attribute is an array
//        else if (object.getClass() == JSONArray.class) {
//            JSONArray newArray = new JSONArray();
//
//            if ()
//        }

        return null;
    }
}
