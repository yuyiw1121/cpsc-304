package ca.ubc.cs304.servlet;

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
        String aid = request.getParameter("aid");
        System.out.println("GETTING PROFILE POST" );
        request.setAttribute("aid", aid);
        request.getRequestDispatcher("ProfilePage.jsp").forward(request, response);
//        PrintWriter pw = response.getWriter();
//        pw.println("aid passed: " + aid);
//        pw.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("GETTING PROFILE GET" );
        String aid = request.getParameter("aid");
        PrintWriter pw = response.getWriter();
        pw.println("aid passed: " + aid);
        pw.close();
    }
}
