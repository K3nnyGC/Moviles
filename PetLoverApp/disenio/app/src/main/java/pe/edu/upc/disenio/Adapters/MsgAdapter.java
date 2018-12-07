package pe.edu.upc.disenio.Adapters;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.widget.AppCompatImageButton;
import android.support.v7.widget.CardView;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;

import java.util.List;

import pe.edu.upc.disenio.Activities.CreateMsgActivity;
import pe.edu.upc.disenio.Activities.ShowAdActivity;
import pe.edu.upc.disenio.MainActivity;
import pe.edu.upc.disenio.Models.Advertisement;
import pe.edu.upc.disenio.Models.Message;
import pe.edu.upc.disenio.R;
import pe.edu.upc.disenio.Service.UserService;
import pe.edu.upc.disenio.Utils.ActivityContext;
import pe.edu.upc.disenio.Utils.DAOException;
import pe.edu.upc.disenio.Utils.MessageDAO;
import retrofit.Callback;
import retrofit.RestAdapter;
import retrofit.RetrofitError;
import retrofit.client.Response;

public class MsgAdapter extends RecyclerView.Adapter<MsgAdapter.MyViewHolder>  {

    private List<Message> msgList;


    public class MyViewHolder extends RecyclerView.ViewHolder {

        public TextView titulo, descripcion, direccion;
        public AppCompatImageButton btn_add, btn_del, btn_sms;
        public CardView cardView;

        public MyViewHolder(View view) {
            super(view);
            titulo = (TextView) view.findViewById(R.id.card_title);
            descripcion = (TextView) view.findViewById(R.id.card_desc);
            direccion = (TextView) view.findViewById(R.id.card_address);
            btn_add = (AppCompatImageButton) view.findViewById(R.id.btn_card_msg_add);
            btn_del = (AppCompatImageButton) view.findViewById(R.id.btn_card_msg_del);
            btn_sms = (AppCompatImageButton) view.findViewById(R.id.btn_card_msg_sms);
            cardView = (CardView) view.findViewById(R.id.message_card);
        }
    }


    public MsgAdapter(List<Message> msgsList) {
        this.msgList = msgsList;
    }

    @Override
    public MyViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        /*View itemView = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.ad_item, parent, false);*/
        View itemView = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.msg_card_item, parent, false);

        return new MyViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(final MyViewHolder holder, final int position) {
        final Message msg = msgList.get(position);
        holder.titulo.setText(msg.getTitle());
        holder.descripcion.setText(msg.getMsg());
        holder.direccion.setText(msg.getDate());

        holder.btn_sms.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Bundle bundle = new Bundle();
                bundle.putInt("user",msg.getIduserdest());
                bundle.putInt("user_dest",msg.getIduser());
                bundle.putBoolean("check",true);
                Intent cardIntent = new Intent(view.getContext(), CreateMsgActivity.class);
                cardIntent.putExtras(bundle);
                view.getContext().startActivity(cardIntent);
            }
        });

        holder.btn_del.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(final View view) {

                RestAdapter restAdapter = new RestAdapter.Builder().setEndpoint(view.getResources().getString(R.string.host)).build();
                UserService servicio = restAdapter.create(UserService.class);
                Message msgU = new Message();
                msgU.setId(msg.getId())
                        .setMsg(msg.getMsg())
                        .setIduser(msg.getIduser())
                        .setIduserdest(msg.getIduserdest())
                        .setTitle(msg.getTitle())
                        .setState(0)
                        ;
                servicio.updateMessage(msgU.getId(),msgU,new Callback<Message>() {
                    @Override
                    public void success(Message msg2, Response response) {
                        Toast.makeText(view.getContext(),"Se borro el mensaje",Toast.LENGTH_SHORT).show();
                       //MainActivity.msgListF.remove(position);
                        //MainActivity.mAdapter3.notifyDataSetChanged();
                        holder.cardView.setVisibility(View.GONE);

                    }

                    @Override
                    public void failure(RetrofitError error) {
                        Toast.makeText(view.getContext(),"Error:" + error.getMessage(),Toast.LENGTH_SHORT).show();
                    }

                });
            }
        });

        holder.btn_add.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {


                MessageDAO dao = new MessageDAO(ActivityContext.getMainactivity());
                try {
                    //dao.eliminarTodos();
                    dao.insertar(msg.getTitle(), msg.getMsg(),msg.getDate());
                } catch (DAOException e) {
                    Log.i("GeneroMusicalNuevoActi", "====> " + e.getMessage());
                }
                Toast.makeText(view.getContext(),"Se agregara a tus mensajes",Toast.LENGTH_SHORT).show();
            }
        });
    }

    @Override
    public int getItemCount() {
        return msgList.size();
    }

}
