package pe.edu.upc.disenio;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.media.MediaScannerConnection;
import android.net.Uri;
import android.os.Environment;
import android.provider.MediaStore;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Base64;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;


import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;

import pe.edu.upc.disenio.Activities.CreateMsgActivity;
import pe.edu.upc.disenio.Activities.MapsActivity;
import pe.edu.upc.disenio.Service.UserService;
import retrofit.Callback;
import retrofit.RestAdapter;
import retrofit.RetrofitError;
import retrofit.client.Response;

import pe.edu.upc.disenio.Models.Advertisement;

public class CreateAd extends AppCompatActivity {
    //Views
    public EditText etTitle;
    public EditText etDescription;
    public EditText etAddress;

    public Spinner spinner;
    public Button bCreAdd;
    public Button bShowMap;

    public TextView tvCoor;

    //String de la imagen

    String imgstring = "";

    //Para imagenes
    public ImageView image;
    private final String CARPETA_RAIZ = "petImages/";
    private final String RUTA_IMG = CARPETA_RAIZ + "pets";
    public String path;

    //Preferencias compartidas
    SharedPreferences sp;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_create_ad);

        //Archivo de preferencias
        sp = getApplicationContext().getSharedPreferences("DataSP", MODE_PRIVATE);

        fillspinner();
        setParts();
    }

    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK && event.getRepeatCount() == 0) {
        // Esto es lo que hace mi botón al pulsar ir a atrás
            //changeActivity("home");
            //finish();
            Intent returnIntent = new Intent();
            setResult(Activity.RESULT_CANCELED, returnIntent);
            finish();
            /*
            Intent returnIntent = new Intent();
            returnIntent.putExtra("result",result);
            setResult(Activity.RESULT_OK,returnIntent);
            finish();
             */
            return true;
        }
        return super.onKeyDown(keyCode, event);
    }

    @Override
    protected void onResume() {
        super.onResume();

        float temp_lat = sp.getFloat("temp_lat",0);
        float temp_long = sp.getFloat("temp_long",0);

        if ((temp_lat != 0) || (temp_long != 0) ){
            tvCoor.setText("Coordenadas registradas!");
        } else {
            tvCoor.setText("No ingresado");
        }

    }

    //funcion de botones

    public void buttonAdd(View view){
        bCreAdd.setEnabled(false);

        String title = etTitle.getText().toString();
        String description = etDescription.getText().toString();
        String address = etAddress.getText().toString();

        String option = spinner.getSelectedItem().toString();

        float temp_lat = sp.getFloat("temp_lat",0);
        float temp_long = sp.getFloat("temp_long",0);

        Boolean check = true;

        if (title.equals("")){
            message("Ingresa el titulo del anuncio");
            check = false;
        }

        if (description.equals("")){
            message("Ingresa una descripcion");
            check = false;
        }

        if (address.equals("")){
            message("Ingresa una referencia de tu direccion");
            check = false;
        }

        if (imgstring.equals("")){
            message("Ingresa una imagen!");
            check = false;
        }

        int status = 0;

        if (option.equals("Encontrado")){
            status = 1;
        }

        if ((temp_lat == 0) && (temp_long == 0) ){
            message("Registra una ubicacion");
            check = false;
        }

        if (check){
            int user_id = sp.getInt("id_user",1);
            Advertisement ad = new Advertisement();
            ad.setTitle(title)
                    .setFlag(0)
                    .setId_user(user_id)
                    .setLatitude((double) temp_lat)
                    .setLongitude((double) temp_long)
                    .setImage(imgstring)
                    .setStatus(status)
                    .setDescription(description)
                    .setAddress(address);
            registerAd(ad);
            SharedPreferences.Editor editor = sp.edit();
            editor.putFloat("temp_lat",0);
            editor.putFloat("temp_long",0);
            editor.putBoolean("coord", false);
            //editor.commit();
            editor.apply();
        } else {
            bCreAdd.setEnabled(true);
        }

    }

    public void linkCancelBtnAd(View view){
        changeActivity("home");
    }


    private void registerAd(Advertisement ad){
        RestAdapter restAdapter = new RestAdapter.Builder().setEndpoint(getResources().getString(R.string.host)).build();
        UserService servicio = restAdapter.create(UserService.class);
        servicio.setAdvertisement(ad,new Callback<Advertisement>() {
            @Override
            public void success(Advertisement ad2, Response response) {
                message("¡Envio Exitoso!");
                changeActivity("home");
            }

            @Override
            public void failure(RetrofitError error) {
                message("Algo no anda bien! " + error.toString());
                bCreAdd.setEnabled(true);
            }

        });
    }

    // Llenar el spiner
    public void fillspinner(){
        spinner = (Spinner) findViewById(R.id.in_ad_spinner);
        // Create an ArrayAdapter using the string array and a default spinner layout
        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(this,R.array.status_list, android.R.layout.simple_spinner_item);
        // Specify the layout to use when the list of choices appears
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        // Apply the adapter to the spinner
        spinner.setAdapter(adapter);
    }

    private void setParts(){
        etTitle = (EditText) findViewById(R.id.in_ad_tittle);
        etDescription = (EditText) findViewById(R.id.in_ad_desc);
        etAddress = (EditText) findViewById(R.id.in_ad_address);
        bCreAdd = (Button) findViewById(R.id.btn_reg_ad);
        tvCoor = (TextView) findViewById(R.id.coor);

        image = (ImageView) findViewById(R.id.img_reg_ad);

    }

    //Boton Imagen

    public void loadimage(View view){
        loadImg();
    }

    private void loadImg() {
        final CharSequence[] options = {"Tomar Foto","Cargar Imagen","Cancelar"};
        final AlertDialog.Builder alertOptions = new AlertDialog.Builder(this);
        alertOptions.setTitle("Seleccione una Opcion");
        alertOptions.setItems(options, new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        if (options[which].equals("Tomar Foto")) {
                            takepicture();
                        } else {
                            if (options[which].equals("Cargar Imagen")){
                                Intent intent = new Intent(Intent.ACTION_PICK, MediaStore.Images.Media.EXTERNAL_CONTENT_URI);
                                intent.setType("image/");
                                startActivityForResult(intent.createChooser(intent,"Seleccione la aplicacion"),10);
                            } else {
                                dialog.dismiss();
                            }
                        }

                    }
                });
        alertOptions.show();
                /*
        Intent intent = new Intent(Intent.ACTION_PICK, MediaStore.Images.Media.EXTERNAL_CONTENT_URI);
        intent.setType("image/");
        startActivityForResult(intent.createChooser(intent,"Seleccione la aplicacion"),10);
*/

    }

    private void takepicture() {
        File fileImage = new File(Environment.getExternalStorageDirectory(), RUTA_IMG);
        String nom="";
        boolean created = fileImage.exists();

        if (created == false) {
            created = fileImage.mkdirs();
        }

        if (created == true) {
            nom = (System.currentTimeMillis()/1000) + ".jpg";
        }

        path = Environment.getExternalStorageDirectory()+File.separator+RUTA_IMG+File.separator+nom;

        File imagec = new File (path);

        Intent intent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
        intent.putExtra(MediaStore.EXTRA_OUTPUT, Uri.fromFile(imagec));
        startActivityForResult(intent,20);
    }


    //Boton mapa

    public void showmap(View view){
        changeActivity("map");
    }

    //Funciones utiles

    private void message(String msg){
        Toast.makeText(this,msg,Toast.LENGTH_SHORT).show();
    }

    private void changeActivity(String destiny){
        switch (destiny) {
            case "home":
                //Intent intent = new Intent(CreateAd.this,MainActivity.class);
                //startActivity(intent);
                //finish();
                Intent returnIntent = new Intent();
                setResult(Activity.RESULT_CANCELED, returnIntent);
                finish();
                break;
            case "map":
                Intent intent2 = new Intent(CreateAd.this,MapsActivity.class);
                //startActivity(intent2);
                startActivityForResult(intent2, 1);
                break;
            default:
                message(":( No Existe la vista!");
                break;
        }

    }

    //De regreso

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

        if (requestCode == 10) {
            if(resultCode == RESULT_OK){
                Uri mypath = data.getData();
                image.setImageURI(mypath);

                try {
                    Bitmap bitmap = MediaStore.Images.Media.getBitmap(this.getContentResolver(), mypath);
                    //imgstring = UriToBitmap(bitmap);
                    imgstring = UriToBitmap(Bitmap.createScaledBitmap(bitmap,200,200,true ));
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        if (requestCode == 20) {
            if(resultCode == RESULT_OK){
                MediaScannerConnection.scanFile(this, new String[]{path}, null,
                        new MediaScannerConnection.OnScanCompletedListener() {
                            @Override
                            public void onScanCompleted(String s, Uri uri) {
                                Log.d("ruta","Path:" + path);
                                Toast.makeText(getApplicationContext(),"Tomo Foto",Toast.LENGTH_SHORT).show();
                            }
                        }
                );

                Bitmap bitmap = BitmapFactory.decodeFile(path);
                bitmap = Bitmap.createScaledBitmap(bitmap,200,200,true );
                imgstring = UriToBitmap(bitmap);
                image.setImageBitmap(bitmap);
            }
        }

        Toast.makeText(this,"Regresaste registro!!!",Toast.LENGTH_LONG).show();
    }//onActivityResult

    private String UriToBitmap(Bitmap bitmap){
        ByteArrayOutputStream array = new ByteArrayOutputStream();
        bitmap.compress(Bitmap.CompressFormat.JPEG,100,array);
        byte[] imageByte = array.toByteArray();
        String imagestring = Base64.encodeToString(imageByte,Base64.DEFAULT);
        return imagestring;
    }

    private void SaveImg(){

    }


}
