package pe.edu.upc.disenio.Activities;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.DefaultItemAnimator;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import java.util.ArrayList;
import java.util.List;

import pe.edu.upc.disenio.Adapters.MsgAdapter;
import pe.edu.upc.disenio.Adapters.SqlSmsAdapter;
import pe.edu.upc.disenio.Models.Message;
import pe.edu.upc.disenio.R;
import pe.edu.upc.disenio.Utils.ActivityContext;
import pe.edu.upc.disenio.Utils.DAOException;
import pe.edu.upc.disenio.Utils.MessageDAO;

public class ShowStoreActivity extends AppCompatActivity {

    public static final List<Message> lista = new ArrayList<>();
    public static final SqlSmsAdapter adapter = new SqlSmsAdapter(lista);

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_show_store);

        //Salvar contexto
        ActivityContext.setShowstoreactivity(this);

        MessageDAO dao = new MessageDAO(getBaseContext());

        try {
            ArrayList<Message> resultados = dao.buscar("");


            RecyclerView recyclerView3;

            recyclerView3 = (RecyclerView) findViewById(R.id.recycler_view_mystor);

            RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(this);
            recyclerView3.setLayoutManager(mLayoutManager);
            recyclerView3.setItemAnimator(new DefaultItemAnimator());

            recyclerView3.setAdapter(adapter);

            adapter.notifyDataSetChanged();

            lista.clear();
           for (Message m : resultados){
               Message msg = new Message();
               msg.setTitle(m.getTitle())
                       .setIduserdest(m.getIduserdest())
                       .setIduser(m.getIduser())
                       .setMsg(m.getMsg())
                       .setId(m.getId())
                       .setDate(m.getDate())
               ;

               lista.add(msg);
               //encontrados[i++] = m.getTitle();
                //Log.d("Salida",m.getTitle());
            }
            adapter.notifyDataSetChanged();




            /*

            Log.d("Salida","Pasa el for");
            ArrayAdapter<String> adaptador = new ArrayAdapter<String>(this.getApplicationContext(),
                    android.R.layout.simple_list_item_1,
                    encontrados);

            ListView listaResultados = (ListView)findViewById(R.id.listaResultados);
            listaResultados.setAdapter(adaptador);
                */

        } catch (DAOException e) {
            Log.i("GeneroMusicalBuscarAc", "====> " + e.getMessage());
        }

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

}
