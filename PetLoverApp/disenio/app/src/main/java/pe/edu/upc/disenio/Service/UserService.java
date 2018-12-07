package pe.edu.upc.disenio.Service;

import java.util.List;

import pe.edu.upc.disenio.Models.Advertisement;
import pe.edu.upc.disenio.Models.DelMsg;
import pe.edu.upc.disenio.Models.Message;
import pe.edu.upc.disenio.Models.Token;
import pe.edu.upc.disenio.Models.User;
import retrofit.Callback;
import retrofit.http.Body;
import retrofit.http.DELETE;
import retrofit.http.GET;
import retrofit.http.POST;
import retrofit.http.PUT;
import retrofit.http.Path;

public interface UserService {

    //Usuarios

    @POST("/api/Owner")
    void setUser(@Body User user, Callback<User> callback);


    @GET("/api/Owner/{email}")
    void getUser(@Path("email") String email, Callback<User> callback);

    @PUT("/api/Owner/{email}")
    void updateUser(@Path("email") String email, @Body User user, Callback<User> callback);

    @GET("/api/Owner")
    void showUsers(Callback<List<User>> callback);

    //Usuarios por Id

    @GET("/api/UserRaw/{id}")
    void getUserbyId(@Path("id") int id, Callback<User> callback);

    //Anuncios

    @POST("/api/Advertisement")
    void setAdvertisement(@Body Advertisement advertisement, Callback<Advertisement> callback);

    @GET("/api/Advertisement/{id}")
    void getAdvertisement(@Path("id") int id, Callback<Advertisement> callback);

    @GET("/api/Advertisement")
    void showAdvertisements(Callback<List<Advertisement>> callback);

    @PUT("/api/Advertisement/{id}")
    void updateAdvertisement(@Path("id") int id, @Body Advertisement advertisement, Callback<Advertisement> callback);

    @DELETE("/api/Advertisement/{id}")
    void deleteAdvertisement(@Path("id") int id, Callback<DelMsg> callback);

    //Mis anuncios

    @GET("/api/Myad/{iduser}")
    void getMyAds(@Path("iduser") int iduser, Callback<List<Advertisement>> callback);

    //Token

    @GET("/api/Token")
    void showTokens(Callback<List<Token>> callback);

    @POST("/api/Token")
    void setToken(@Body Token token, Callback<Token> callback);

    @PUT("/api/Token/{id}")
    void updateToken(@Path("id") int id, @Body Token token, Callback<Token> callback);

    //Mensajes

    @GET("/api/Message/{id}")
    void getMessage(@Path("id") int id, Callback<Message> callback);

    @POST("/api/Message")
    void setMessage(@Body Message message, Callback<Message> callback);

    @PUT("/api/Message/{id}")
    void updateMessage(@Path("id") int id, @Body Message message, Callback<Message> callback);


    //Mis mensajes
    @GET("/api/MyMsg/{iduser}")
    void getMessages(@Path("iduser") int iduser, Callback<List<Message>> callback);

}
