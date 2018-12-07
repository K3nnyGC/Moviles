package pe.edu.upc.disenio.Activities;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import pe.edu.upc.disenio.Models.Message;
import pe.edu.upc.disenio.R;
import pe.edu.upc.disenio.Service.UserService;
import retrofit.Callback;
import retrofit.RestAdapter;
import retrofit.RetrofitError;
import retrofit.client.Response;

public class CreateMsgActivity extends AppCompatActivity {

    EditText title,msg;
    Button send,cancel;

    //Preferencias compartidas
    SharedPreferences sp;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_create_msg);

        //Archivo de preferencias
        sp = getApplicationContext().getSharedPreferences("DataSP", MODE_PRIVATE);

        //Relacionando partes del layout
        setParts();
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


    private void setParts(){
        title = (EditText) findViewById(R.id.in_msg_tittle);
        msg = (EditText) findViewById(R.id.in_msg_desc);
        send = (Button) findViewById(R.id.btn_reg_msg);
        cancel = (Button) findViewById(R.id.btn_cancel_msg);
    }

    public void sendmsg(View view){
        send.setEnabled(false);
        cancel.setEnabled(false);
        String titulo = title.getText().toString();
        String cuerpo = msg.getText().toString();

        Boolean ok = true;

        if (titulo.equals("")){
            ok = false;
        }

        if (cuerpo.equals("")){
            ok = false;
        }

        if (!ok){
            Toast.makeText(this,"Todos los campos son obligatorios",Toast.LENGTH_SHORT).show();
            send.setEnabled(true);
            cancel.setEnabled(true);
        } else {
            Boolean indicator = getIntent().getExtras().getBoolean("check",false);
            int id_user_creator;
            int id_user;
            if (!indicator){
                id_user_creator = getIntent().getExtras().getInt("id_user_creator");
                id_user = sp.getInt("id_user",0);
            } else {
                id_user_creator = getIntent().getExtras().getInt("user");
                id_user = getIntent().getExtras().getInt("user_dest");
            }



            Message msg = new Message();
            msg.setTitle(titulo)
                    .setMsg(cuerpo)
                    .setState(1)
                    .setIduser(id_user)
                    .setIduserdest(id_user_creator);
            trysendmsg(msg);
        }

    }

    private void trysendmsg(Message message) {
        RestAdapter restAdapter = new RestAdapter.Builder().setEndpoint(getResources().getString(R.string.host)).build();
        UserService servicio = restAdapter.create(UserService.class);
        servicio.setMessage(message,new Callback<Message>() {
            @Override
            public void success(Message msg2, Response response) {
                message("Mensaje enviado! ");
                send.setEnabled(true);
                cancel.setEnabled(true);
                title.setText("");
                msg.setText("");
                //
                Intent returnIntent = new Intent();
                setResult(Activity.RESULT_CANCELED, returnIntent);
                finish();
                //

            }

            @Override
            public void failure(RetrofitError error) {
                message("Algo no anda bien! " + error.toString());
                send.setEnabled(true);
                cancel.setEnabled(true);
            }

        });
    }

    public void cancelMsg(View view){
        Intent returnIntent = new Intent();
        setResult(Activity.RESULT_CANCELED, returnIntent);
        finish();
    }

    private void message(String msg){
        Toast.makeText(this,msg,Toast.LENGTH_SHORT).show();
    }
}
