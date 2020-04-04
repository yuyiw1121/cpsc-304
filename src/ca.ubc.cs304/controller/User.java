package ca.ubc.cs304.controller;

import ca.ubc.cs304.database.DatabaseConnectionHandler;
import ca.ubc.cs304.model.UserModel;

public class User {
    private DatabaseConnectionHandler dbHandler = null;

    public User() { dbHandler = new DatabaseConnectionHandler(); }

    public void insertUser(String username, String password) { dbHandler.insertUser(username, password); }

    public void userLogin(String username, String password) { dbHandler.userLogin(username,password); }

}
