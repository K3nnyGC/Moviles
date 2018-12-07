package pe.edu.upc.disenio.Activities;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.service.quicksettings.Tile;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Base64;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import pe.edu.upc.disenio.Models.Advertisement;
import pe.edu.upc.disenio.Models.User;
import pe.edu.upc.disenio.R;
import pe.edu.upc.disenio.Service.UserService;
import pe.edu.upc.disenio.Utils.JustifyTextView;
import retrofit.Callback;
import retrofit.RestAdapter;
import retrofit.RetrofitError;
import retrofit.client.Response;

public class ShowAdActivity extends AppCompatActivity {

    public TextView title, status;
    public static TextView namecomple;
    //public TextView body;
    public JustifyTextView body;
    public ImageView image;
    public Advertisement ad;
    public int id_user_creator;
    public Double latitude;
    public Double longitude;

    public static String nameComplete = "";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_show_ad);

        namecomple = (TextView) findViewById(R.id.name_user);

        setParts();
        setValues();
    }

    private void setParts(){
        title = (TextView) findViewById(R.id.tx_title);
        //body = (TextView) findViewById(R.id.tx_body);
        body = (JustifyTextView) findViewById(R.id.tx_body);
        status = (TextView) findViewById(R.id.tx_status);
        image = (ImageView) findViewById(R.id.show_main_img);
    }

    private void setValues(){
        String tx_title = getIntent().getExtras().getString("titulo");
        String tx_descr = getIntent().getExtras().getString("descripcion");
        int tx_status = getIntent().getExtras().getInt("status");

        int id_creator = getIntent().getExtras().getInt("id_user");
        String nameCre = getName(id_creator);

        title.setText(tx_title);
        body.setText(tx_descr + "\r\n");


        if (tx_status == 0){
            status.setText("Perdido");
        } else {
            status.setText("Encontrado");
        }

        id_user_creator = getIntent().getExtras().getInt("id_user");

        latitude = getIntent().getExtras().getDouble("latitude");
        longitude = getIntent().getExtras().getDouble("longitude");

        if (!getIntent().getExtras().getString("image").equals("")){
            byte[]  imageBytes = Base64.decode(getIntent().getExtras().getString("image"), Base64.DEFAULT);
            Bitmap decodedImage = BitmapFactory.decodeByteArray(imageBytes, 0, imageBytes.length);
            image.setImageBitmap(decodedImage);
        }

        //Toast.makeText(this,String.valueOf(latitude),Toast.LENGTH_SHORT).show();




    }

    public void sendMsg(View view){
        Bundle bundle = new Bundle();
        bundle.putInt("id_user_creator",id_user_creator);

        Intent msgIntent = new Intent(view.getContext(), CreateMsgActivity.class);
        msgIntent.putExtras(bundle);
        //view.getContext().startActivity(msgIntent);
        startActivityForResult(msgIntent, 1);
    }

    public void showmap(View view){
        Bundle bundle = new Bundle();
        bundle.putDouble("latitude",latitude);
        bundle.putDouble("longitude",longitude);

        Intent msgIntent = new Intent(view.getContext(), showPositionActivity.class);
        msgIntent.putExtras(bundle);
        view.getContext().startActivity(msgIntent);
    }

    public void calluser(View view){
        view.setEnabled(false);
        final View bcall = view;

        RestAdapter restAdapter = new RestAdapter.Builder().setEndpoint(getResources().getString(R.string.host)).build();
        UserService servicio = restAdapter.create(UserService.class);
        servicio.getUserbyId(id_user_creator,new Callback<User>() {
            @Override
            public void success(User user, Response response) {
                String nph = user.getPhone();
                startActivity(new Intent(Intent.ACTION_DIAL, Uri.fromParts("tel",nph,null)));
                bcall.setEnabled(true);
            }

            @Override
            public void failure(RetrofitError error) {
                Toast.makeText(getApplicationContext(),error.getMessage(),Toast.LENGTH_LONG).show();
                bcall.setEnabled(true);
            }

        });


    }


    public String getName(int id){

        RestAdapter restAdapter = new RestAdapter.Builder().setEndpoint(getResources().getString(R.string.host)).build();
        UserService servicio = restAdapter.create(UserService.class);
        servicio.getUserbyId(id,new Callback<User>() {
            @Override
            public void success(User user, Response response) {
                namecomple.setText(user.getName() + " " + user.getLastname());
            }

            @Override
            public void failure(RetrofitError error) {
                namecomple.setText("");
            }

        });
        return "";
    }


    //Funciones utiles

    private void message(String msg){
        Toast.makeText(this,msg,Toast.LENGTH_SHORT).show();
    }

    private void changeActivity(String destiny){
        switch (destiny) {

            case "createmsg":
                Intent intent2 = new Intent(ShowAdActivity.this,CreateMsgActivity.class);
                //startActivity(intent2);
                startActivityForResult(intent2, 1);
                break;
            default:
                message(":( No Existe la vista!");
                break;
        }

    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {

        if (requestCode == 1) {
            if(resultCode == Activity.RESULT_OK){
                String result=data.getStringExtra("result");
            }
            if (resultCode == Activity.RESULT_CANCELED) {
                //Write your code if there's no result
            }
        }
        Toast.makeText(this,"Regresaste!!!",Toast.LENGTH_LONG).show();
    }//onActivityResult
}
