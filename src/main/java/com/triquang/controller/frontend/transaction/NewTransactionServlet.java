package com.triquang.controller.frontend.transaction;

import java.io.IOException;

import com.triquang.service.TransactionService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CreateTransactionServlet
 */
@WebServlet("/new_transaction")
public class NewTransactionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewTransactionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TransactionService transactionService = new TransactionService(request, response);
		transactionService.showTransactiondetailsNewForm();
	}

}
