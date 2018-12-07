package pe.edu.upc.disenio.Utils;

import android.content.Context;

public class ActivityContext {
    public static Context mainactivity;

    public static Context showstoreactivity;

    public static Context getMainactivity() {
        return mainactivity;
    }

    public static void setMainactivity(Context mainactivity) {
        ActivityContext.mainactivity = mainactivity;
    }

    public static Context getShowstoreactivity() {
        return showstoreactivity;
    }

    public static void setShowstoreactivity(Context showstoreactivity) {
        ActivityContext.showstoreactivity = showstoreactivity;
    }
}
