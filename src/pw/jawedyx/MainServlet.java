package pw.jawedyx;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class MainServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {


        response.setContentType("text/html; charset=UTF8");

        ArrayList<Node> nodeList = new ArrayList<>();

        nodeList.add(new Node("root", "#", "Root"));
        nodeList.add(new Node("node.a", "root", "A"));
        nodeList.add(new Node("node.b", "root", "B"));
        nodeList.add(new Node("node.aa", "node.a", "AA"));
        nodeList.add(new Node("node.c", "root", "C"));
        nodeList.add(new Node("node.cc", "node.c", "CC"));
        nodeList.add(new Node("node.ccc", "node.cc", "CCC"));

        String data = Node.parseData(nodeList);

        request.setAttribute("data", data);

        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}