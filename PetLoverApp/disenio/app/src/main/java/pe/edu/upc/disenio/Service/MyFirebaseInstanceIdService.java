package pe.edu.upc.disenio.Service;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;

import android.util.Log;
import android.widget.Toast;

import com.google.firebase.iid.FirebaseInstanceId;
import com.google.firebase.iid.FirebaseInstanceIdService;
import com.google.firebase.messaging.FirebaseMessaging;

import pe.edu.upc.disenio.Models.Token;
import pe.edu.upc.disenio.R;
import retrofit.Callback;
import retrofit.RestAdapter;
import retrofit.RetrofitError;
import retrofit.client.Response;

public class MyFirebaseInstanceIdService  extends FirebaseInstanceIdService  {

    private static final String TAG = "MyFirebaseIdService";
    private static final String TOPIC_GLOBAL = "global";

    @Override
    public void onCreate() {
        super.onCreate();
        /*
        String refreshedToken = FirebaseInstanceId.getInstance().getToken();
        sendRegistrationToServer(refreshedToken);
        */

    }



    @Override
    public void onTokenRefresh() {
        // Get updated InstanceID token.
        String refreshedToken = FirebaseInstanceId.getInstance().getToken();
        Log.d(TAG, "Refreshed token: " + refreshedToken);

        // now subscribe to `global` topic to receive app wide notifications
        FirebaseMessaging.getInstance().subscribeToTopic(TOPIC_GLOBAL);

        // If you want to send messages to this application instance or
        // manage this apps subscriptions on the server side, send the
        // Instance ID token to your app server.

        sendRegistrationToServer(refreshedToken);
    }

    /**
     * Persist token to third-party servers.
     * <p>
     * Modify this method to associate the user's FCM InstanceID token with any server-side account
     * maintained by your application.
     *
     * @param token The new token.
     */
    private void sendRegistrationToServer(String token) {
        // TODO: Implement this method to send token to your app server.
        /*
        Token tk = new Token();
        //TODO: relacionar el usuario con el token
        tk.setId_user(1)
                .setTk(token);
        RestAdapter restAdapter = new RestAdapter.Builder().setEndpoint(getResources().getString(R.string.host)).build();
        UserService servicio = restAdapter.create(UserService.class);
        servicio.setToken(tk,new Callback<Token>() {
            @Override
            public void success(Token tkr, Response response) {
                Toast.makeText(getApplicationContext(),"Registrado token!",Toast.LENGTH_LONG).show();
            }

            @Override
            public void failure(RetrofitError error) {
                Toast.makeText(getApplicationContext(),error.getMessage(),Toast.LENGTH_LONG).show();
            }

        });
        */
    }

}
