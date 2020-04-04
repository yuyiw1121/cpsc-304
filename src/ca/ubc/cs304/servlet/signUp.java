package ca.ubc.cs304.servlet;

import ca.ubc.cs304.database.DatabaseConnectionHandler;
import ca.ubc.cs304.model.AccountModel;
import ca.ubc.cs304.model.UserModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

@WebServlet(name = "signUp")
public class signUp extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DatabaseConnectionHandler dbHandler = new DatabaseConnectionHandler();
        dbHandler.login("ora_ywo7w1b", "a60661196");
        System.out.println("SIGNING UP...");
        PrintWriter pw = response.getWriter();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String hcid = request.getParameter("hcid");
        Random rand = new Random();
        int aid = rand.nextInt(1000);
        String donorFlag = request.getParameter("donor");
        String receiverFlag = request.getParameter("receiver");
        String accountType;

        if(donorFlag != null) {
            accountType = "DONOR";
        }
        else {
            accountType = "RECEIVER";
        }

        System.out.println("username: " +username + "\n");
        System.out.println("password: " +password+ "\n");
        System.out.println("hcid: " +hcid+ "\n");
        System.out.println("accountType: " +accountType+ "\n");
        System.out.println("assigned aid:" + aid+ "\n");
        AccountModel newAccount = new AccountModel(username,password,aid,"UNAPPROVED", accountType);

        dbHandler.insertUser(newAccount, Integer.valueOf(hcid));

        pw.println("Sign up successfully...");

        dbHandler.close();
        pw.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
