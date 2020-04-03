package es.upm.dit.isst.tfg.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.upm.dit.isst.tfg.dao.TFGDAOImplementation;
import es.upm.dit.isst.tfg.model.TFG;

@WebServlet("/ServeFileServlet")
public class ServeFileServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email = (String) (req.getParameter("tfgemail"));
		TFG tfg = TFGDAOImplementation.getInstance().read(email);
		resp.setContentType("application/pdf");
		resp.setHeader("Content-Disposition",String.format("attachment; filename=\"%s\"", "memoria.pdf"));
		resp.setContentLength(tfg.getDocument().length);
		resp.getOutputStream().write(tfg.getDocument());

    }

}
