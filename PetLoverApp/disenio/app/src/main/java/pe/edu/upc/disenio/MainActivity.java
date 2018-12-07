package pe.edu.upc.disenio;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Typeface;
import android.support.design.widget.TabLayout;
import android.support.design.widget.FloatingActionButton;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.DefaultItemAnimator;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;

import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.view.ViewPager;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;

import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

import pe.edu.upc.disenio.Activities.EditProfileActivity;
import pe.edu.upc.disenio.Activities.ShowStoreActivity;
import pe.edu.upc.disenio.Adapters.AdsAdapter;
import pe.edu.upc.disenio.Adapters.MsgAdapter;
import pe.edu.upc.disenio.Adapters.MyAdAdpter;
import pe.edu.upc.disenio.Models.Advertisement;


import pe.edu.upc.disenio.Models.Message;
import pe.edu.upc.disenio.Service.UserService;
import pe.edu.upc.disenio.Utils.ActivityContext;
import retrofit.Callback;
import retrofit.RestAdapter;
import retrofit.RetrofitError;
import retrofit.client.Response;

public class MainActivity extends AppCompatActivity {

    /**
     * The {@link android.support.v4.view.PagerAdapter} that will provide
     * fragments for each of the sections. We use a
     * {@link FragmentPagerAdapter} derivative, which will keep every
     * loaded fragment in memory. If this becomes too memory intensive, it
     * may be best to switch to a
     * {@link android.support.v4.app.FragmentStatePagerAdapter}.
     */
    private SectionsPagerAdapter mSectionsPagerAdapter;

    /**
     * The {@link ViewPager} that will host the section contents.
     */
    private ViewPager mViewPager;


    public static final List<Advertisement> adListF = new ArrayList<>();
    public static final AdsAdapter mAdapter2 = new AdsAdapter(adListF);

    public static final List<Advertisement> adListF2 = new ArrayList<>();
    public static final MyAdAdpter mAdapter4 = new MyAdAdpter(adListF2);

    public static final List<Message> msgListF = new ArrayList<>();
    public static final MsgAdapter mAdapter3 = new MsgAdapter(msgListF);

    //Preferencias compartidas
    SharedPreferences sp;

    private Typeface oswald;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //tipo de letra
        this.oswald = Typeface.createFromAsset(getAssets(),"fonts/Oswald-Regular.ttf");

        //Archivo de preferencias
        sp = getApplicationContext().getSharedPreferences("DataSP", MODE_PRIVATE);

        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        // Create the adapter that will return a fragment for each of the three
        // primary sections of the activity.
        mSectionsPagerAdapter = new SectionsPagerAdapter(getSupportFragmentManager());

        // Set up the ViewPager with the sections adapter.
        mViewPager = (ViewPager) findViewById(R.id.container);
        mViewPager.setAdapter(mSectionsPagerAdapter);

        TabLayout tabLayout = (TabLayout) findViewById(R.id.tabs);

        mViewPager.addOnPageChangeListener(new TabLayout.TabLayoutOnPageChangeListener(tabLayout));
        tabLayout.addOnTabSelectedListener(new TabLayout.ViewPagerOnTabSelectedListener(mViewPager));

        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                //Snackbar.make(view, "Hey aun no hago nada! Falta poco.", Snackbar.LENGTH_LONG).setAction("Action", null).show();
                newadd();
            }
        });



        //llenar recycler de todos los mensajes
        fillRecycler();
        //llenar recysbles de tosos tus mensajes
        fillRecyclerMsg();
        //llenar mis mensajes
        fillRecyclerMyads();

        //Salvar contexto
        ActivityContext.setMainactivity(this);


    }



    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK && event.getRepeatCount() == 0) {
            finish();
            return true;
        }
        return super.onKeyDown(keyCode, event);
    }



    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_out) {
            finish();
            return true;
        }

        if (id == R.id.action_profile) {
            changeActivity("edit_profile");
            return true;
        }

        if (id == R.id.action_store) {
            changeActivity("edit_store");
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    /**
     * A placeholder fragment containing a simple view.
     */
    public static class PlaceholderFragment extends Fragment {
        /**
         * The fragment argument representing the section number for this
         * fragment.
         */
        private static final String ARG_SECTION_NUMBER = "section_number";

        public PlaceholderFragment() {
        }

        /**
         * Returns a new instance of this fragment for the given section
         * number.
         */
        public static PlaceholderFragment newInstance(int sectionNumber) {
            PlaceholderFragment fragment = new PlaceholderFragment();
            Bundle args = new Bundle();
            args.putInt(ARG_SECTION_NUMBER, sectionNumber);
            fragment.setArguments(args);
            return fragment;
        }

        @Override
        public View onCreateView(LayoutInflater inflater, ViewGroup container,
                                 Bundle savedInstanceState) {
                View rootView;
                TextView textView;
                //Nuevos
                RecyclerView recyclerView2;
                AdsAdapter mAdapter2;
                List<Advertisement> adList2 = new ArrayList<>();
                switch (getArguments().getInt(ARG_SECTION_NUMBER)) {
                    case 1:
                        rootView = inflater.inflate(R.layout.fragment_ini, container, false);
                        loadRecycler(rootView);
                        break;
                    case 2:
                        rootView = inflater.inflate(R.layout.fragment_myads, container, false);
                        loadRecyclerMyads(rootView);
                        break;
                    case 3:
                        rootView = inflater.inflate(R.layout.fragment_mymsg, container, false);
                        loadRecyclerMsg(rootView);
                        break;
                    default:
                        rootView = inflater.inflate(R.layout.fragment_main, container, false);
                        textView = (TextView) rootView.findViewById(R.id.section_label);
                        textView.setText(getString(R.string.section_format, getArguments().getInt(ARG_SECTION_NUMBER)));
                        break;
                }




            return rootView;
        }


    }

    /**
     * A {@link FragmentPagerAdapter} that returns a fragment corresponding to
     * one of the sections/tabs/pages.
     */
    public class SectionsPagerAdapter extends FragmentPagerAdapter {

        public SectionsPagerAdapter(FragmentManager fm) {
            super(fm);
        }

        @Override
        public Fragment getItem(int position) {
            // getItem is called to instantiate the fragment for the given page.
            // Return a PlaceholderFragment (defined as a static inner class below).
            return PlaceholderFragment.newInstance(position + 1);
        }

        @Override
        public int getCount() {
            // Show 3 total pages.
            return 3;
        }
    }


    // Funcion del boton flotante
    public void newadd(){
        changeActivity("create_ad");
    }



    //Metodos estaticos de carga
    //1.Recycler de todos los anuncios

    public static void loadRecycler(View view){
        RecyclerView recyclerView2;
        //AdsAdapter mAdapter2;
        List<Advertisement> adList2 = new ArrayList<>();

        recyclerView2 = (RecyclerView) view.findViewById(R.id.recycler_view);
        //mAdapter2 = new AdsAdapter(adList2);
        //mAdapter2 = new AdsAdapter(adListF);
        RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(view.getContext());
        recyclerView2.setLayoutManager(mLayoutManager);
        recyclerView2.setItemAnimator(new DefaultItemAnimator());

        //Linea de separacion
        //recyclerView2.addItemDecoration(new DividerItemDecoration(view.getContext(), LinearLayoutManager.VERTICAL));

        recyclerView2.setAdapter(mAdapter2);

        /*
        Advertisement ad = new Advertisement();
        ad.setTitle("Perro perdido")
                .setDescription("Se ha perdido hace mucho")
                .setAddress("Av la marina crd 32");
        //adList2.add(ad);
        adListF.add(ad);

        ad = new Advertisement();
        ad.setTitle("Perro perdido 2")
                .setDescription("Se ha perdido ooohhhh")
                .setAddress("Av Sucre");
        //adList2.add(ad);
        adListF.add(ad);
        */

        /*

        */

        mAdapter2.notifyDataSetChanged();
    }

    //2.Recycler de todos mis anuncios

    public static void loadRecyclerMyads(View view){
        RecyclerView recyclerView4;

        List<Advertisement> adList3 = new ArrayList<>();

        recyclerView4 = (RecyclerView) view.findViewById(R.id.recycler_view_myads);
        RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(view.getContext());
        recyclerView4.setLayoutManager(mLayoutManager);
        recyclerView4.setItemAnimator(new DefaultItemAnimator());


        recyclerView4.setAdapter(mAdapter4);

        mAdapter4.notifyDataSetChanged();
    }

    //Recycler de todos mis mensajes
    public static void loadRecyclerMsg(View view){
        RecyclerView recyclerView3;
        List<Message> msgList = new ArrayList<>();

        recyclerView3 = (RecyclerView) view.findViewById(R.id.recycler_view_mymsg);

        RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(view.getContext());
        recyclerView3.setLayoutManager(mLayoutManager);
        recyclerView3.setItemAnimator(new DefaultItemAnimator());

        recyclerView3.setAdapter(mAdapter3);

        mAdapter3.notifyDataSetChanged();
    }

    //Llenar recycler de todos los ads

    public void fillRecycler(){
        RestAdapter restAdapter = new RestAdapter.Builder().setEndpoint(getResources().getString(R.string.host)).build();
        UserService servicio = restAdapter.create(UserService.class);
        servicio.showAdvertisements(new Callback<List<Advertisement>>() {
            @Override
            public void success(List<Advertisement> lista, Response response) {
                adListF.clear();
                for (int indice = 0; indice < lista.size(); indice++) {
                    Advertisement ad = new Advertisement();
                    ad.setTitle(lista.get(indice).getTitle())
                            .setDescription(lista.get(indice).getDescription())
                            .setAddress(lista.get(indice).getAddress())
                            .setId_user(lista.get(indice).getId_user())
                            .setLatitude(lista.get(indice).getLatitude())
                            .setLongitude(lista.get(indice).getLongitude())
                            .setStatus(lista.get(indice).getStatus())
                            .setImage(lista.get(indice).getImage())
                    ;

                    adListF.add(ad);
                }
                mAdapter2.notifyDataSetChanged();

            }

            @Override
            public void failure(RetrofitError error) {
                //message("No se cargaron los Anuncios");

            }

        });
    }

    //Llenar recycler de mis ads

    public void fillRecyclerMyads(){
        RestAdapter restAdapter = new RestAdapter.Builder().setEndpoint(getResources().getString(R.string.host)).build();
        UserService servicio = restAdapter.create(UserService.class);
        int id_user = sp.getInt("id_user",0);
        servicio.getMyAds(id_user,new Callback<List<Advertisement>>() {
            @Override
            public void success(List<Advertisement> lista, Response response) {
                adListF2.clear();
                for (int indice = 0; indice < lista.size(); indice++) {
                    Advertisement ad = new Advertisement();
                    ad.setTitle(lista.get(indice).getTitle())
                            .setDescription(lista.get(indice).getDescription())
                            .setAddress(lista.get(indice).getAddress())
                            .setId_user(lista.get(indice).getId_user())
                            .setLatitude(lista.get(indice).getLatitude())
                            .setLongitude(lista.get(indice).getLongitude())
                            .setStatus(lista.get(indice).getStatus())
                            .setImage(lista.get(indice).getImage())
                            .setId(lista.get(indice).getId())
                    ;

                    adListF2.add(ad);
                }
                mAdapter4.notifyDataSetChanged();

            }

            @Override
            public void failure(RetrofitError error) {
                //message("No se cargaron los Anuncios");

            }

        });
    }

    //Llenar recyclers de mensajes


    public void fillRecyclerMsg(){
        RestAdapter restAdapter = new RestAdapter.Builder().setEndpoint(getResources().getString(R.string.host)).build();
        UserService servicio = restAdapter.create(UserService.class);
        int id_user = sp.getInt("id_user",0);
        servicio.getMessages(id_user,new Callback<List<Message>>() {
            @Override
            public void success(List<Message> lista, Response response) {
                msgListF.clear();
                for (int indice = 0; indice < lista.size(); indice++) {
                    Message msg = new Message();
                    msg.setTitle(lista.get(indice).getTitle())
                        .setIduserdest(lista.get(indice).getIduserdest())
                        .setIduser(lista.get(indice).getIduser())
                        .setMsg(lista.get(indice).getMsg())
                        .setId(lista.get(indice).getId())
                        .setDate((lista.get(indice).getDate()))
                    ;

                    msgListF.add(msg);
                }
                mAdapter4.notifyDataSetChanged();

            }

            @Override
            public void failure(RetrofitError error) {
                //message("No se cargaron los Anuncios");

            }

        });

        /*
        msgListF.clear();
        /*
        Message msg = new Message();
            msg.setTitle("Encontre a tu perro")
                .setMsg("Esta nervisos y mordiendo todo, ven a buscarlo a Av...");
        msgListF.add(msg);

        msg = new Message();
        msg.setTitle("Soy el dueño del loro!")
                .setMsg("Porfavor comunicate para coordinar la entrega, gracias!");
        msgListF.add(msg);

        msg = new Message();
        msg.setTitle("Creo que vi a tu gato")
                .setMsg("Lo vi por el parque San Carlos...");
        msgListF.add(msg);
        */

        //mAdapter3.notifyDataSetChanged();
    }


    //Metodos utiles

    private void message(String msg){
        Toast.makeText(this,msg,Toast.LENGTH_SHORT).show();
    }

    private void changeActivity(String destiny){
        switch (destiny) {
            case "home":
                Intent intent = new Intent(MainActivity.this,MainActivity.class);
                startActivity(intent);
                finish();
                break;
            case "register":
                Intent intent2 = new Intent(MainActivity.this,RegActivity.class);
                startActivity(intent2);
                break;
            case "create_ad":
                Intent intent3 = new Intent(MainActivity.this,CreateAd.class);
                startActivityForResult(intent3, 1);
                //startActivity(intent3);
                //finish();
                break;
            case "edit_profile":
                Intent intent4 = new Intent(MainActivity.this,EditProfileActivity.class);
                startActivityForResult(intent4, 1);
                //startActivity(intent3);
                //finish();
                break;
            case "edit_store":
                Intent intent5 = new Intent(MainActivity.this,ShowStoreActivity.class);
                startActivityForResult(intent5, 1);
                //startActivity(intent3);
                //finish();
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
        //llenar recycler de todos los mensajes
        fillRecycler();
        //llenar recysbles de tosos tus mensajes
        fillRecyclerMsg();
        //llenar mis mensajes
        fillRecyclerMyads();
        Toast.makeText(this,"Regresaste!!!",Toast.LENGTH_LONG).show();
    }//onActivityResult

    @Override
    protected void onResume() {
        super.onResume();
        //llenar recycler de todos los mensajes
        fillRecycler();
        //llenar recysbles de tosos tus mensajes
        fillRecyclerMsg();
        //llenar mis mensajes
        fillRecyclerMyads();
    }


}
