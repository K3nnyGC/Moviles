package pe.edu.upc.disenio.Activities;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v4.app.FragmentActivity;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.widget.Toast;

import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.OnMapReadyCallback;
import com.google.android.gms.maps.SupportMapFragment;
import com.google.android.gms.maps.model.BitmapDescriptor;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.MarkerOptions;

import pe.edu.upc.disenio.CreateAd;
import pe.edu.upc.disenio.MainActivity;
import pe.edu.upc.disenio.R;

public class MapsActivity extends FragmentActivity implements OnMapReadyCallback {

    private GoogleMap mMap;

    //Preferencias compartidas
    SharedPreferences sp;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_maps);
        // Obtain the SupportMapFragment and get notified when the map is ready to be used.
        SupportMapFragment mapFragment = (SupportMapFragment) getSupportFragmentManager()
                .findFragmentById(R.id.map);
        mapFragment.getMapAsync(this);

        //Archivo de preferencias
        sp = getApplicationContext().getSharedPreferences("DataSP", MODE_PRIVATE);


        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab2);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                //Snackbar.make(view, "Se guardo tu direccion en el marcador", Snackbar.LENGTH_LONG).setAction("Action", null).show();
                changeActivity("regad");

            }
        });
    }



    //Antigio grandle
    //implementation 'com.google.android.gms:play-services-maps:16.0.0'
    /**
     * Manipulates the map once available.
     * This callback is triggered when the map is ready to be used.
     * This is where we can add markers or lines, add listeners or move the camera. In this case,
     * we just add a marker near Sydney, Australia.
     * If Google Play services is not installed on the device, the user will be prompted to install
     * it inside the SupportMapFragment. This method will only be triggered once the user has
     * installed Google Play services and returned to the app.
     */
    @Override
    public void onMapReady(GoogleMap googleMap) {
        mMap = googleMap;

        float temp_lat = sp.getFloat("temp_lat",-12.076901f);
        float temp_lon = sp.getFloat("temp_long",-77.093633f);
        Boolean coord = sp.getBoolean("coord",false);

        if (!coord){
            temp_lat = -12.076901f;
            temp_lon = -77.093633f;
        }

        // Add a marker in Sydney and move the camera
        LatLng sydney = new LatLng(temp_lat, temp_lon);
        mMap.addMarker(new MarkerOptions().position(sydney)
                .title("Ubicacion para publicar")
                .icon(BitmapDescriptorFactory.fromResource(R.drawable.marker))
        );
        mMap.moveCamera(CameraUpdateFactory.newLatLng(sydney));
        mMap.moveCamera(CameraUpdateFactory.newLatLngZoom(sydney,18));
        //mMap.clear();

        if (!coord){
            mMap.clear();
        }

        //Click sostenido

        mMap.setOnMapLongClickListener(new GoogleMap.OnMapLongClickListener() {
            @Override
            public void onMapLongClick(LatLng latLng) {
                MarkerOptions mo = new MarkerOptions();
                mo.position(latLng);
                mo.icon(BitmapDescriptorFactory.fromResource(R.drawable.marker));
                //mo.anchor(0.0f,0.0f);
                mo.draggable(true);
                mMap.clear();
                mMap.addMarker(mo);

                SharedPreferences.Editor editor = sp.edit();
                editor.putFloat("temp_lat",(float) latLng.latitude);
                editor.putFloat("temp_long",(float) latLng.longitude);
                editor.putBoolean("coord", true);
                //editor.commit();
                editor.apply();

                ;
            }
        });
    }

    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK && event.getRepeatCount() == 0) {
            Intent returnIntent = new Intent();
            setResult(Activity.RESULT_CANCELED, returnIntent);
            finish();
            return true;
        }
        return super.onKeyDown(keyCode, event);
    }




    //Funciones utiles

    private void message(String msg){
        Toast.makeText(this,msg,Toast.LENGTH_SHORT).show();
    }

    private void changeActivity(String destiny){
        switch (destiny) {
            case "regad":
                //Intent intent = new Intent(MapsActivity.this,CreateAd.class);
                //startActivity(intent);
                //finish();
                Intent returnIntent = new Intent();
                setResult(Activity.RESULT_CANCELED, returnIntent);
                finish();
                break;

            default:
                message(":( No Existe la vista!");
                break;
        }

    }
}
