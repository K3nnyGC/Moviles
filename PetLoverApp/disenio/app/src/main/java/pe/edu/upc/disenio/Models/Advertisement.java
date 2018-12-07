package pe.edu.upc.disenio.Models;

public class Advertisement {
    public String title;
    public int status;
    public String description;
    public String image;
    public double latitude;
    public double longitude;
    public String address;
    public int flag;
    public int id_user;
    public int id;
    public String date;

    public String getTitle() {
        return title;
    }

    public Advertisement setTitle(String title) {
        this.title = title;
        return this;
    }

    public int getStatus() {
        return status;
    }

    public Advertisement setStatus(int status) {
        this.status = status;
        return this;
    }

    public String getDescription() {
        return description;
    }

    public Advertisement setDescription(String description) {
        this.description = description;
        return this;
    }

    public String getImage() {
        return image;
    }

    public Advertisement setImage(String image) {
        this.image = image;
        return this;
    }

    public double getLatitude() {
        return latitude;
    }

    public Advertisement setLatitude(double latitude) {
        this.latitude = latitude;
        return this;
    }

    public double getLongitude() {
        return longitude;
    }

    public Advertisement setLongitude(double longitude) {
        this.longitude = longitude;
        return this;
    }

    public String getAddress() {
        return address;
    }

    public Advertisement setAddress(String address) {
        this.address = address;
        return this;
    }

    public int getFlag() {
        return flag;
    }

    public Advertisement setFlag(int flag) {
        this.flag = flag;
        return this;
    }

    public int getId_user() {
        return id_user;
    }

    public Advertisement setId_user(int id_user) {
        this.id_user = id_user;
        return this;
    }

    public int getId() {
        return id;
    }

    public Advertisement setId(int id) {
        this.id = id;
        return this;
    }

    public String getDate() {
        return date;
    }

    public Advertisement setDate(String date) {
        this.date = date;
        return this;
    }


    @Override
    public String toString() {
        return "Advertisement{" +
                "title='" + title + '\'' +
                ", status=" + status +
                ", description='" + description + '\'' +
                ", image='" + image + '\'' +
                ", latitude=" + latitude +
                ", longitude=" + longitude +
                ", address='" + address + '\'' +
                ", flag=" + flag +
                ", id_user=" + id_user +
                ", id=" + id +
                ", date='" + date + '\'' +
                '}';
    }
}
