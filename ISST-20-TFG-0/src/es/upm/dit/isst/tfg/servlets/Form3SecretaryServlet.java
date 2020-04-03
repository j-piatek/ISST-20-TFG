package es.upm.dit.isst.tfg.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.upm.dit.isst.tfg.dao.TFGDAOImplementation;
import es.upm.dit.isst.tfg.model.TFG;

@WebServlet("/Form3SecretaryServlet")
public class Form3SecretaryServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	@Override

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		TFG tfg = TFGDAOImplementation.getInstance().read(req.getParameter("tfgemail"));
		tfg.setStatus(3);
		TFGDAOImplementation.getInstance().update(tfg);
		req.getSession().setAttribute("tfgs",TFGDAOImplementation.getInstance().readAll());
		getServletContext().getRequestDispatcher("/Admin.jsp").forward(req,resp);

    }
	
	

}
