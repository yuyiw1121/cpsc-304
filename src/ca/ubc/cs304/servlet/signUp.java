package ca.ubc.cs304.servlet;

import ca.ubc.cs304.database.DatabaseConnectionHandler;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "signUp")
public class signUp extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DatabaseConnectionHandler dbHandler = new DatabaseConnectionHandler();
        dbHandler.login("ora_ywo7w1b", "a60661196");
        System.out.println("SIGNING UP...");
        PrintWriter pw = response.getWriter();
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        int aid = dbHandler.insertUser(username, password, "donor");

        if(aid != 0) {
            pw.println("Sign up successfully...");
        }
        else {
            pw.println("Oops, something went wrong, please try again");
        }
        dbHandler.close();
        pw.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
