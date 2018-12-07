package pe.edu.upc.disenio.Models;

public class Token {
    public int id;
    public int id_user;
    public String tk;
    public String date;

    public int getId() {
        return id;
    }

    public Token setId(int id) {
        this.id = id;
        return this;
    }

    public int getId_user() {
        return id_user;
    }

    public Token setId_user(int id_user) {
        this.id_user = id_user;
        return this;
    }

    public String getTk() {
        return tk;
    }

    public Token setTk(String tk) {
        this.tk = tk;
        return this;
    }

    public String getDate() {
        return date;
    }

    public Token setDate(String date) {
        this.date = date;
        return this;
    }

    @Override
    public String toString() {
        return "Token{" +
                "id=" + id +
                ", id_user=" + id_user +
                ", tk='" + tk + '\'' +
                ", date='" + date + '\'' +
                '}';
    }
}
