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

import pe.edu.upc.disenio.Models.User;
import pe.edu.upc.disenio.R;
import pe.edu.upc.disenio.Service.UserService;
import retrofit.Callback;
import retrofit.RestAdapter;
import retrofit.RetrofitError;
import retrofit.client.Response;

public class EditProfileActivity extends AppCompatActivity {

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
        setContentView(R.layout.activity_edit_profile);

        //Archivo de preferencias
        sp = getApplicationContext().getSharedPreferences("DataSP", MODE_PRIVATE);

        //Asignacion de views
        setParts();
        loadvalues();
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


    private void loadvalues(){
        String name = sp.getString("name_user","-");
        String lastname = sp.getString("lastname_user","-");
        String dni = sp.getString("dni_user","-");
        String email = sp.getString("email_user","-");
        String phone = sp.getString("phone_user","-");

        etName.setText(name);
        etLastname.setText(lastname);
        etDni.setText(dni);
        etEmail.setText(email);
        etEmail.setEnabled(false);
        etPhone.setText(phone);
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


    public void returntemp(View view){
        Intent returnIntent = new Intent();
        setResult(Activity.RESULT_CANCELED, returnIntent);
        finish();

    }

    public void tryUpdate(View view){
        bReg.setEnabled(false);
        String nameEdit = etName.getText().toString();
        String lastnameEdit = etLastname.getText().toString();
        String dniEdit = etDni.getText().toString();
        String passEdit = etPassword.getText().toString();
        String passEdit2 = etPassword2.getText().toString();
        String phoneEdit = etPhone.getText().toString();

        Boolean ok = true;

        if (nameEdit.equals("")){
            ok = false;
        }

        if (lastnameEdit.equals("")){
            ok = false;
        }

        if (dniEdit.equals("")){
            ok = false;
        }

        if (phoneEdit.equals("")){
            ok = false;
        }


        Boolean equi = true;

        if (!passEdit.equals(passEdit2) && !passEdit.equals("") ){
            equi = false;
        }

        if (passEdit.equals("")){
            passEdit = sp.getString("pass_user","123");
        }

        if (!equi){
            Toast.makeText(this,"Las contraseñas no son iguales",Toast.LENGTH_SHORT).show();
        }

        if (!ok){
            Toast.makeText(this,"Hay campos vacios",Toast.LENGTH_SHORT).show();
        }

        if (equi && ok){
            User user = new User();
            user.setDni(dniEdit)
                    .setName(nameEdit)
                    .setLastname(lastnameEdit)
                    .setEmail(etEmail.getText().toString())
                    .setPhone(phoneEdit)
                    .setPassword(passEdit);

            updateUser(user);
        } else {
            bReg.setEnabled(true);
        }
    }

    public void updateUser(User user){
        RestAdapter restAdapter = new RestAdapter.Builder().setEndpoint(getResources().getString(R.string.host)).build();
        UserService servicio = restAdapter.create(UserService.class);
        servicio.updateUser(user.getEmail(), user, new Callback<User>() {
            @Override
            public void success(User moduser, Response response) {
                Toast.makeText(getApplicationContext(),"Actualizado",Toast.LENGTH_SHORT).show();
                saveIdUser(moduser);
                bReg.setEnabled(true);

            }

            @Override
            public void failure(RetrofitError error) {
                Toast.makeText(getApplicationContext(),"Error: " + error.getMessage(),Toast.LENGTH_SHORT).show();
                bReg.setEnabled(true);
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

}
