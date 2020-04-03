package ca.ubc.cs304.servlet;

import ca.ubc.cs304.database.DatabaseConnectionHandler;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "userLogin")
public class userLogin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("LOGGING IN...");
        PrintWriter pw = response.getWriter();
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        pw.println(username + " " + password);

        System.out.println("username: " + username + " password: " + password);

        DatabaseConnectionHandler dbHandler = new DatabaseConnectionHandler();
        dbHandler.login("ora_ywo7w1b", "a60661196");

        int aid = dbHandler.userLogin(username, password);

        if(aid != 0) {
            pw.println("login successfully, account id: " + aid);
        }
        else {
            pw.println("Wrong password!");
        }
        dbHandler.close();

        pw.close();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
