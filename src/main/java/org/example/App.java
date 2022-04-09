package org.example;


import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import com.mysql.cj.jdbc.Driver;

class MyJDBC{

    Connection conn;
    String db = "myjdbc";
    String url = "jdbc:mysql://192.168.229.164:3306/myjdbc";
    String username = "root";
    String passwd = "root";

    public MyJDBC(){
        try {
            DriverManager.registerDriver(new Driver());
            conn = DriverManager.getConnection(url,username,passwd);
//            conn.setSchema(db);
            conn.setAutoCommit(false);
        }catch (Exception e){
            e.printStackTrace();
        }

    }

    public void doTransaction(){
        try{
            Statement stmt = conn.createStatement();
            ResultSet res =  stmt.executeQuery("select * from students");
            while(res.next()){
                System.out.println(res.getInt(1)+"\t"+res.getString(2)+"\t"+
                        res.getString(3)+"\t"+res.getInt(4)+"\t"+res.getInt(5)+"\t");
            }
            conn.commit();
        }catch (Exception e){
            e.printStackTrace();
        }

    }

}

public class App 
{
    public static void main( String[] args )
    {

        System.out.println( "Hello World!" );

        MyJDBC myJDBC = new MyJDBC();
        myJDBC.doTransaction();
    }
}
