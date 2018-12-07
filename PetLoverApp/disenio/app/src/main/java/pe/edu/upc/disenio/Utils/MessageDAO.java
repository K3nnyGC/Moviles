package pe.edu.upc.disenio.Utils;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.util.Log;

import java.util.ArrayList;

import pe.edu.upc.disenio.Models.Message;

public class MessageDAO {

    private DbHelper _dbHelper;

    public MessageDAO(Context c) {
        _dbHelper = new DbHelper(c);
    }

    public void insertar(String title, String msg, String fecha) throws DAOException {
        Log.i("MessageDAO", "insertar()");
        SQLiteDatabase db = _dbHelper.getWritableDatabase();
        try {
            String[] args = new String[]{title, msg, fecha };
            db.execSQL("INSERT INTO message(title, msg, fecha) VALUES(?,?,?)", args);
            Log.i("MessageDAO", "Se insertó");
        } catch (Exception e) {
            throw new DAOException("MessageDAO: Error al insertar: " + e.getMessage());
        } finally {
            if (db != null) {
                db.close();
            }
        }
    }

    public Message obtener() throws DAOException {
        Log.i("MessageDAO", "obtener()");
        SQLiteDatabase db = _dbHelper.getReadableDatabase();
        Message modelo = new Message();
        try {
            Cursor c = db.rawQuery("select title, msg, fecha from message", null);
            if (c.getCount() > 0) {
                c.moveToFirst();
                do {
                    String fecha = c.getString(c.getColumnIndex("fecha"));
                    String titulo = c.getString(c.getColumnIndex("title"));
                    String descripcion = c.getString(c.getColumnIndex("msg"));

                } while (c.moveToNext());
            }
            c.close();
        } catch (Exception e) {
            throw new DAOException("MessageDAO: Error al obtener: " + e.getMessage());
        } finally {
            if (db != null) {
                db.close();
            }
        }
        return modelo;
    }

    public ArrayList<Message> buscar(String criterio) throws DAOException {
        Log.i("MessageDAO", "buscar()");
        SQLiteDatabase db = _dbHelper.getReadableDatabase();
        ArrayList<Message> lista = new ArrayList<Message>();
        try {
            Cursor c = db.rawQuery("select id, title, msg, fecha from message", null);

            if (c.getCount() > 0) {
                c.moveToFirst();
                do {
                    //Pase del resultado a la clase
                    int id = c.getInt(c.getColumnIndex("id"));
                    String fecha = c.getString(c.getColumnIndex("fecha"));
                    String titulo = c.getString(c.getColumnIndex("title"));
                    String descripcion = c.getString(c.getColumnIndex("msg"));

                    Message modelo = new Message();
                    modelo.setTitle(titulo).setMsg(descripcion).setDate(fecha).setId(id);

                    lista.add(modelo);
                } while (c.moveToNext());
            }
            c.close();
        } catch (Exception e) {
            throw new DAOException("MessageDAO: Error al obtener: " + e.getMessage());
        } finally {
            if (db != null) {
                db.close();
            }
        }
        return lista;
    }

    public void eliminar(int id) throws DAOException {
        Log.i("MessageDAO", "eliminar()");
        SQLiteDatabase db = _dbHelper.getWritableDatabase();

        try {
            String[] args = new String[]{String.valueOf(id)};
            db.execSQL("DELETE FROM message WHERE id=?", args);
        } catch (Exception e) {
            throw new DAOException("MessageDAO: Error al eliminar: " + e.getMessage());
        } finally {
            if (db != null) {
                db.close();
            }
        }
    }

    public void eliminarTodos() throws DAOException {
        Log.i("MessageDAO", "eliminarTodos()");
        SQLiteDatabase db = _dbHelper.getWritableDatabase();

        try {
            db.execSQL("DELETE FROM message");
        } catch (Exception e) {
            throw new DAOException("GeneroMusicalDAO: Error al eliminar todos: " + e.getMessage());
        } finally {
            if (db != null) {
                db.close();
            }
        }
    }


}
