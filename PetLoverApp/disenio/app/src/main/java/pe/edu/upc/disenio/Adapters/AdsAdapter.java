package pe.edu.upc.disenio.Adapters;

import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.support.v7.widget.CardView;
import android.support.v7.widget.RecyclerView;
import android.util.Base64;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.List;

import pe.edu.upc.disenio.Activities.ShowAdActivity;
import pe.edu.upc.disenio.Models.Advertisement;
import pe.edu.upc.disenio.R;
import pe.edu.upc.disenio.Utils.ActivityContext;

public class AdsAdapter extends RecyclerView.Adapter<AdsAdapter.MyViewHolder>  {

    private List<Advertisement> adsList;

    public class MyViewHolder extends RecyclerView.ViewHolder {

        public TextView titulo, descripcion, direccion;
        public CardView card;
        public ImageView image;

        public MyViewHolder(View view) {
            super(view);
            titulo = (TextView) view.findViewById(R.id.card_title);
            descripcion = (TextView) view.findViewById(R.id.card_desc);
            direccion = (TextView) view.findViewById(R.id.card_address);
            card = (CardView) view.findViewById(R.id.knowledgeCard);
            image = (ImageView) view.findViewById(R.id.ad_card_img);
        }
    }


    public AdsAdapter(List<Advertisement> peliculasList) {
        this.adsList = peliculasList;
    }

    @Override
    public MyViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        /*View itemView = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.ad_item, parent, false);*/
        View itemView = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.ad_card_item, parent, false);

        return new MyViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(MyViewHolder holder, final int position) {
        final Advertisement ad = adsList.get(position);

        holder.titulo.setText(ad.getTitle());
        holder.descripcion.setText(ad.getDescription());
        holder.direccion.setText(ad.getAddress());

        if (!ad.getImage().equals("")){
            byte[]  imageBytes = Base64.decode(ad.getImage(), Base64.DEFAULT);
            Bitmap decodedImage = BitmapFactory.decodeByteArray(imageBytes, 0, imageBytes.length);
            holder.image.setImageBitmap(decodedImage);
        }




        holder.card.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Bundle bundle = new Bundle();
                bundle.putInt("currentPosition",position);
                bundle.putString("titulo",ad.getTitle());
                bundle.putString("descripcion",ad.getDescription());
                bundle.putInt("status",ad.getStatus());
                bundle.putInt("id_user",ad.getId_user());
                bundle.putDouble("latitude",ad.getLatitude());
                bundle.putDouble("longitude",ad.getLongitude());
                bundle.putString("image",ad.getImage());
                Intent cardIntent = new Intent(v.getContext(), ShowAdActivity.class);
                cardIntent.putExtras(bundle);
                v.getContext().startActivity(cardIntent);
            }
        });

    }

    @Override
    public int getItemCount() {
        return adsList.size();
    }

}
