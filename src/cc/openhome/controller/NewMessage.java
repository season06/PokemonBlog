package cc.openhome.controller;

import java.util.*;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cc.openhome.model.Blog;
import cc.openhome.model.UserService;

@WebServlet(
	name = "NewMessage",
	urlPatterns = {"/new_message"},
	initParams = {
		@WebInitParam(name = "SUCCESS_PATH", value = "blog"),
		@WebInitParam(name = "ERROR_PATH", value = "search.jsp")
	}
)
public class NewMessage extends HttpServlet
{
	private String SUCCESS_PATH;
	private String ERROR_PATH;

    @Override
    public void init() throws ServletException
    {
    	SUCCESS_PATH = getServletConfig().getInitParameter("SUCCESS_PATH");
    	ERROR_PATH = getServletConfig().getInitParameter("ERROR_PATH");
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
                             		throws ServletException, IOException
    {
    	String username = (String) request.getSession().getAttribute("login");
    	UserService userService = 
    			(UserService) getServletContext().getAttribute("userService");
    	
    	Blog blog = new Blog();
    	
    	response.setCharacterEncoding("UTF-8");
    	String pokemon = request.getParameter("poke_id");
    	String txt = request.getParameter("txt");
    	System.out.println(txt);
    	
    	List<String> error = new ArrayList<>();
    	if(txt == null || txt.length() == 0)
    		error.add("You don't enter any message!");
    	
    	if(txt.length() < 200)
    	{
    		blog.setID(UUID.randomUUID().toString().replaceAll("-", ""));
    		blog.setUsername(username);
    		blog.setPokemon(pokemon);
    		blog.setTxt(txt);
    		blog.setTime(new Date());
    		userService.addInfo(blog);
    	}
    	else
    		error.add("Max message's length is 200");
    	
    	if(error.isEmpty())
    	{
    		response.sendRedirect(SUCCESS_PATH);
    	}
    	else
    	{
    		request.setAttribute("error", error);
        	request.getRequestDispatcher(ERROR_PATH).forward(request, response);
    	}
    		
    }

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}
