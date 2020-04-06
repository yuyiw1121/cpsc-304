package ca.ubc.cs304.servlet;

import ca.ubc.cs304.database.DatabaseConnectionHandler;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "getProfile")
public class getProfile extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("GETTING PROFILE GET" );
        String aid = request.getParameter("aid");
        PrintWriter pw = response.getWriter();
        pw.println("aid passed: " + aid);
        DatabaseConnectionHandler dbHandler = new DatabaseConnectionHandler();
        dbHandler.login("ora_ywo7w1b", "a60661196");
        dbHandler.getUserProfile(aid);

        pw.close();
    }
}
