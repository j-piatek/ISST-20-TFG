package es.upm.dit.isst.tfg.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import es.upm.dit.isst.tfg.dao.ProfessorDAOImplementation;
import es.upm.dit.isst.tfg.dao.TFGDAOImplementation;
import es.upm.dit.isst.tfg.model.Professor;
import es.upm.dit.isst.tfg.model.TFG;

@WebServlet("/Form2ProfessorServlet")
public class Form2ProfessorServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	         TFG tfg = TFGDAOImplementation.getInstance().read(req.getParameter("tfgemail"));
	         tfg.setStatus(2);
	         TFGDAOImplementation.getInstance().update(tfg);
	         
	         req.getSession().setAttribute("profesor", ProfessorDAOImplementation.getInstance().read(((Professor)req.getSession().getAttribute("profesor")).getEmail()));
	         
	         getServletContext().getRequestDispatcher("/ProfesorView.jsp").forward(req,resp);
	}

}
