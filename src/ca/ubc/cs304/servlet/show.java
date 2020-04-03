package ca.ubc.cs304.servlet;

import ca.ubc.cs304.controller.Bank;
import ca.ubc.cs304.database.DatabaseConnectionHandler;
import ca.ubc.cs304.model.BranchModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet(name = "show")
public class show extends HttpServlet {
    private DatabaseConnectionHandler dbHandler = null;
    private Connection connection = null;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //connect to db
        Bank bank = new Bank();
        dbHandler = new DatabaseConnectionHandler();
        dbHandler.login("ora_ywo7w1b", "a60661196");

        System.out.println("connected to db");
        BranchModel[] branchs = dbHandler.getBranchInfo();
        System.out.println(branchs.toString());

        //get table name
        String tableName = request.getParameter("table");
        PrintWriter pw = response.getWriter();

        pw.println("<table border=1>");
        for(int i = 0; i < branchs.length;i++ ) {
            BranchModel bm = branchs[i];
            pw.println("<tr><td>"+bm.getId()+"</td><td>"+bm.getName()+"</td>"+
                    "<td>"+bm.getAddress()+"</td>"+
                    "<td>"+bm.getCity()+"</td>"+
                    "<td>"+bm.getPhoneNumber()+"</td></tr>");
        }
        pw.println("</table>");
        pw.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
