package pe.edu.upc.disenio;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;


import com.google.firebase.iid.FirebaseInstanceId;
import com.google.firebase.messaging.FirebaseMessaging;

import pe.edu.upc.disenio.Models.Token;
import pe.edu.upc.disenio.Models.User;
import pe.edu.upc.disenio.Service.UserService;
import retrofit.Callback;
import retrofit.RestAdapter;
import retrofit.RetrofitError;
import retrofit.client.Response;

public class RegActivity extends AppCompatActivity {

    //Views
    public EditText etName;
    public EditText etLastname;
    public EditText etDni;
    public EditText etEmail;
    public EditText etPassword;
    public EditText etPassword2;
    public EditText etPhone;
    public Button bReg;

    //Preferencias compartidas
    SharedPreferences sp;




    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_reg);
        //Archivo de preferencias
        sp = getApplicationContext().getSharedPreferences("DataSP", MODE_PRIVATE);

        //Asignacion de views
        setParts();
    }

    private void setParts(){
        etName = (EditText) findViewById(R.id.ip_name);
        etLastname = (EditText) findViewById(R.id.ip_lastname);
        etDni = (EditText) findViewById(R.id.ip_dni);
        etEmail = (EditText) findViewById(R.id.ip_mail);
        etPassword = (EditText) findViewById(R.id.ip_password);
        etPassword2 = (EditText) findViewById(R.id.ip_password_dup);
        etPhone = (EditText) findViewById(R.id.ip_phone);
        bReg = (Button) findViewById(R.id.btn_reg);
    }

    //Metodos de botones

    public void btnRegClick(View view){
        bReg.setEnabled(false);
        String name = etName.getText().toString();
        String lastname = etLastname.getText().toString();
        String dni = etDni.getText().toString();
        String email = etEmail.getText().toString();
        String pass1 = etPassword.getText().toString();
        String pass2 = etPassword2.getText().toString();
        String phone = etPhone.getText().toString();

        Boolean check = true;

        if (name.equals("")){
            message("Ingresa tu nombre");
            check = false;
        }

        if (lastname.equals("")){
            message("Ingresa tu apellido");
            check = false;
        }

        if (dni.equals("")){
            message("Ingresa el numero de tu DNI");
            check = false;
        }

        if (email.equals("")){
            message("Ingresa un correo válido");
            check = false;
        }

        if (pass1.equals("")){
            message("La constraseña es obligatoria");
            check = false;
        }

        if (!pass1.equals(pass2)){
            message("Las constraseñas no son iguales");
            check = false;
        }

        if (phone.equals("")){
            message("El telefono es necesario");
            check = false;
        }

        if (check){
            User user = new User();
            user.setName(name)
                .setLastname(lastname)
                .setDni(dni)
                .setEmail(email)
                .setPhone(phone)
                .setPassword(pass1);
            register(user);
        } else {
            bReg.setEnabled(true);
        }
    }

    public void linkCancelBtn(View view){
        changeActivity("login");
    }


    //Metodos Internos

    private void register(User user){
        RestAdapter restAdapter = new RestAdapter.Builder().setEndpoint(getResources().getString(R.string.host)).build();
        UserService servicio = restAdapter.create(UserService.class);
        servicio.setUser(user,new Callback<User>() {
            @Override
            public void success(User usercom, Response response) {
                FirebaseMessaging.getInstance().subscribeToTopic("global");
                saveIdUser(usercom);
                sendtoken(usercom.id);
                message("¡Bienvenido a la familia PetLover!");
                changeActivity("home");
            }

            @Override
            public void failure(RetrofitError error) {
                message("El mail y/o password no existen! " + error.toString());
                bReg.setEnabled(true);
            }

        });
    }



    //Metodos utiles

    private void message(String msg){
        Toast.makeText(this,msg,Toast.LENGTH_SHORT).show();
    }

    private void changeActivity(String destiny){
        switch (destiny) {
            case "home":
                Intent intent = new Intent(RegActivity.this,MainActivity.class);
                startActivity(intent);
                finish();
                break;
            case "register":
                Intent intent2 = new Intent(RegActivity.this,RegActivity.class);
                startActivity(intent2);
                break;
            case "login":
                Intent intent3 = new Intent(RegActivity.this,tab.class);
                startActivity(intent3);
                finish();
                break;
            default:
                message(":( No Existe la vista!");
                break;
        }

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
                Toast.makeText(getApplicationContext(),"Registrado token!",Toast.LENGTH_LONG).show();
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
        //editor.commit();
        editor.apply();
    }
}
