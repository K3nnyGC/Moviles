package pe.edu.upc.disenio.Utils;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteDatabase.CursorFactory;
import android.database.sqlite.SQLiteOpenHelper;

public class DbHelper extends SQLiteOpenHelper {

    public DbHelper(Context context, String name, CursorFactory factory, int version) {
        super(context, name, factory, version);
    }

    public DbHelper(Context context) {
        // null porque se va a usar el SQLiteCursor
        super(context, "petlover.db", null, 2);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        //String sql = "CREATE TABLE IF NOT EXISTS message (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, msg TEXT NOT NULL, iduser INTEGER NOT NULL, iduserdest INTEGER NOT NULL)";
        String sql = "CREATE TABLE IF NOT EXISTS message (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, msg TEXT NOT NULL, fecha TEXT NOT NULL )";
        db.execSQL(sql);
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        db.execSQL("DROP TABLE IF EXISTS message");
        onCreate(db);
    }
}
