package pe.edu.upc.disenio;

import android.content.Intent;
import android.os.Handler;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.ImageView;

public class SplashScreen extends AppCompatActivity {

    ImageView image;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash_screen);

        //casting

        image = (ImageView) findViewById(R.id.logocentral);
        init();

        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                Intent intent = new Intent(SplashScreen.this, tab.class);
                startActivity(intent);
                finish();
            }
        },1500);
    }

    public void init(){
        Animation animation = AnimationUtils.loadAnimation(this,R.anim.translation);
        animation.setFillAfter(true);
        image.startAnimation(animation);
    }
}
