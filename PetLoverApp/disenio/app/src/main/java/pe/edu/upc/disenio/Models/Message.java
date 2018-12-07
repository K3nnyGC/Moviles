package pe.edu.upc.disenio.Models;

public class Message {
    int id;
    String title;
    String msg;
    int iduser;
    int iduserdest;
    String date;
    int state;

    public int getId() {
        return id;
    }

    public Message setId(int id) {
        this.id = id;
        return this;
    }

    public String getTitle() {
        return title;
    }

    public Message setTitle(String title) {
        this.title = title;
        return this;
    }

    public String getMsg() {
        return msg;
    }

    public Message setMsg(String msg) {
        this.msg = msg;
        return this;
    }

    public int getIduser() {
        return iduser;
    }

    public Message setIduser(int iduser) {
        this.iduser = iduser;
        return this;
    }

    public int getIduserdest() {
        return iduserdest;
    }

    public Message setIduserdest(int iduserdes) {
        this.iduserdest = iduserdes;
        return this;
    }

    public String getDate() {
        return date;
    }

    public Message setDate(String date) {
        this.date = date;
        return this;
    }

    public int getState() {
        return state;
    }

    public Message setState(int state) {
        this.state = state;
        return this;
    }

    @Override
    public String toString() {
        return "Message{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", msg='" + msg + '\'' +
                ", iduser=" + iduser +
                ", iduserdes=" + iduserdest +
                ", date='" + date + '\'' +
                ", state=" + state +
                '}';
    }
}
