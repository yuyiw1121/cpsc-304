package ca.ubc.cs304.servlet;

import ca.ubc.cs304.database.DatabaseConnectionHandler;
import ca.ubc.cs304.model.UserModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "searchBType")
public class searchBType extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter pw = response.getWriter();
        String bloodType = request.getParameter("bloodType");
        System.out.println("acquired blood type: " + bloodType);
        pw.println("blood type selected: " + bloodType);
        DatabaseConnectionHandler dbHandler = new DatabaseConnectionHandler();
        dbHandler.login("ora_ywo7w1b", "a60661196");
        UserModel[] users = dbHandler.getUsersWithBType(bloodType);

        System.out.println(users.toString());

        request.getRequestDispatcher("SearchPageResults.jsp").forward(request, response);

        dbHandler.close();

        pw.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
