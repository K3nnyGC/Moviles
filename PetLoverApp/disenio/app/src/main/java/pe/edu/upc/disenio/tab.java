package pe.edu.upc.disenio;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.google.firebase.iid.FirebaseInstanceId;

import pe.edu.upc.disenio.Models.Token;
import pe.edu.upc.disenio.Models.User;
import pe.edu.upc.disenio.Service.UserService;
import retrofit.Callback;
import retrofit.RestAdapter;
import retrofit.RetrofitError;
import retrofit.client.Response;

public class tab extends AppCompatActivity {
    //Views
    public EditText etEmail;
    public EditText etPassword;
    public CheckBox cbCheck;
    public TextView tvTest;


    public Button bt;

    //Preferencias compartidas
    SharedPreferences sp;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_tab);
        //Archivo de preferencias
        sp = getApplicationContext().getSharedPreferences("DataSP", MODE_PRIVATE);

        //Asignacion de views
        setParts();

        //definicion de estados si aplica

        setInfoParts();

    }

    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK && event.getRepeatCount() == 0) {
            // Esto es lo que hace mi botón al pulsar ir a atrás
            //changeActivity("home");
            //finish();
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

    private void setParts(){
        etEmail = (EditText) findViewById(R.id.input_mail);
        etPassword = (EditText) findViewById(R.id.input_password);
        cbCheck = (CheckBox) findViewById(R.id.checkBox);
        tvTest = (TextView) findViewById(R.id.text_test);
        bt = (Button) findViewById(R.id.btn_login);

    }

    private void setInfoParts(){
        //checkbox
        Boolean ck = sp.getBoolean("flag",false);
        cbCheck.setChecked(ck);

        if (ck){
            //email
            String eg = sp.getString("email","");
            etEmail.setText(eg);
            //Password
            String pg = sp.getString("password","");
            etPassword.setText(pg);
        }

    }

    public void btnClick(View view){
        bt.setEnabled(false);
        Boolean check = true;
        if (etEmail.getText().toString().length() == 0){
            Toast.makeText(this, "Ingresa un email "+etEmail.getText().toString(), Toast.LENGTH_SHORT).show();
            check = false;
        }
        if (etPassword.getText().toString().length() == 0){
            Toast.makeText(this, "Ingresa un password " + etPassword.getText().toString(), Toast.LENGTH_SHORT).show();
            check = false;
        }

        if(check){
            //Toast.makeText(this, "Todo correcto c:"+etEmail.getText().toString()+" p:"+etPassword.getText().toString(), Toast.LENGTH_SHORT).show();
            if (cbCheck.isChecked()){
                SharedPreferences.Editor editor = sp.edit();
                editor.putString("email",etEmail.getText().toString());
                editor.putString("password",etPassword.getText().toString());
                editor.apply();
            }

            login(etEmail.getText().toString(),etPassword.getText().toString());
        } else {
            bt.setEnabled(true);
        }

    }

    public void linkClick(View view){
        changeActivity("register");
    }

    public void checkstatus(View view){

        //SharedPreferences sharedPreferences = getPreferences(Context.MODE_PRIVATE);
        SharedPreferences.Editor editor = sp.edit();
        editor.putBoolean("flag",cbCheck.isChecked());
        //editor.commit();
        editor.apply();

        if (cbCheck.isChecked()){
            Toast.makeText(this,"Activado!",Toast.LENGTH_SHORT).show();
        } else {
            Toast.makeText(this,"Desactivado!",Toast.LENGTH_SHORT).show();
        }

    }

    private void login(String email, final String password){
        RestAdapter restAdapter = new RestAdapter.Builder().setEndpoint(getResources().getString(R.string.host)).build();
        UserService servicio = restAdapter.create(UserService.class);
        Log.d("correo: ",email);
        servicio.getUser(email,new Callback<User>() {
            @Override
            public void success(User user, Response response) {
                if (user.password.equals(password) ){
                    saveIdUser(user);
                    message("Acceso otorgado!");
                    sendtoken(user.id);
                    changeActivity("home");
                } else {
                    deleteIdUser();
                    message("Error en el password!");
                    bt.setEnabled(true);
                    //tvTest.setText("Error en el password!>"+user.password+">"+password);
                }

            }

            @Override
            public void failure(RetrofitError error) {
                //saveIdUser(0);
                message("Error: " + error.toString());
                bt.setEnabled(true);
            }

        });
    }

    private void sendtoken(int userid){
        String token = FirebaseInstanceId.getInstance().getToken();
        Token tk = new Token();
        //int userid = sp.getInt("user_id",0);
        //TODO: relacionar el usuario con el token
        tk.setId_user(userid)
                .setTk(token);
        RestAdapter restAdapter = new RestAdapter.Builder().setEndpoint(getResources().getString(R.string.host)).build();
        UserService servicio = restAdapter.create(UserService.class);
        servicio.setToken(tk,new Callback<Token>() {
            @Override
            public void success(Token tkr, Response response) {
                //Toast.makeText(getApplicationContext(),"Registrado token!",Toast.LENGTH_LONG).show();
            }

            @Override
            public void failure(RetrofitError error) {
                Toast.makeText(getApplicationContext(),error.getMessage(),Toast.LENGTH_LONG).show();
            }

        });
    }


    private void saveIdUser(User user){
        SharedPreferences.Editor editor = sp.edit();
        editor.putInt("id_user",user.id);
        editor.putString("dni_user",user.dni);
        editor.putString("name_user",user.name);
        editor.putString("lastname_user",user.lastname);
        editor.putString("email_user",user.email);
        editor.putString("pass_user",user.password);
        editor.putString("phone_user",user.phone);
        //editor.commit();
        editor.apply();
    }

    private void deleteIdUser(){
        SharedPreferences.Editor editor = sp.edit();
        editor.putInt("id_user",0);
        editor.putString("dni_user","");
        editor.putString("name_user","");
        editor.putString("lastname_user","");
        editor.putString("email_user","");
        editor.putString("pass_user","");
        editor.putString("phone_user","");
        //editor.commit();
        editor.apply();
    }

    //funciones utiles

    private void message(String msg){
        Toast.makeText(this,msg,Toast.LENGTH_LONG).show();
    }

    private void changeActivity(String destiny){
        switch (destiny) {
            case "home":
                Intent intent = new Intent(tab.this,MainActivity.class);
                startActivity(intent);
                finish();
                break;
            case "register":
                Intent intent2 = new Intent(tab.this,RegActivity.class);
                startActivity(intent2);
                finish();
                break;
            default:
                message(":( No Existe la vista!");
                break;
        }

    }

}
