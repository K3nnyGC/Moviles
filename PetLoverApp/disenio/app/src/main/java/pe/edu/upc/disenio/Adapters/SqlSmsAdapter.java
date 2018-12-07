package pe.edu.upc.disenio.Adapters;

import android.content.Context;
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

public class SqlSmsAdapter extends RecyclerView.Adapter<SqlSmsAdapter.MyViewHolder>  {

    private List<Message> msgList;


    public class MyViewHolder extends RecyclerView.ViewHolder {

        public TextView titulo, descripcion, direccion;
        public AppCompatImageButton btn_add, btn_del;
        public CardView cardView;

        public MyViewHolder(View view) {
            super(view);
            titulo = (TextView) view.findViewById(R.id.card_title);
            descripcion = (TextView) view.findViewById(R.id.card_desc);
            direccion = (TextView) view.findViewById(R.id.card_address);
            btn_add = (AppCompatImageButton) view.findViewById(R.id.btn_card_msg_add);
            btn_del = (AppCompatImageButton) view.findViewById(R.id.btn_card_msg_del);
            cardView = (CardView) view.findViewById(R.id.message_card);
        }
    }


    public SqlSmsAdapter(List<Message> msgsList) {
        this.msgList = msgsList;
    }

    @Override
    public MyViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        /*View itemView = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.ad_item, parent, false);*/
        View itemView = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.msg_card_item_sql, parent, false);

        return new MyViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(final MyViewHolder holder, int position) {
        final Message msg = msgList.get(position);
        holder.titulo.setText(msg.getTitle());
        holder.descripcion.setText(msg.getMsg());
        holder.direccion.setText(msg.getDate());

        holder.btn_del.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(final View view) {

                MessageDAO dao = new MessageDAO(ActivityContext.getShowstoreactivity());
                try {
                    dao.eliminar(msg.getId());
                    //dao.insertar(msg.getTitle(), msg.getMsg(),msg.getDate());
                } catch (DAOException e) {
                    Log.i("GeneroMusicalNuevoActi", "====> " + e.getMessage());
                }
                Toast.makeText(view.getContext(),"Mensaje Eliminado",Toast.LENGTH_SHORT).show();
                holder.cardView.setVisibility(View.GONE);
            }
        });


    }

    @Override
    public int getItemCount() {
        return msgList.size();
    }

}