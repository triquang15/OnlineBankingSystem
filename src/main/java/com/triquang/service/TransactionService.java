package com.triquang.service;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.triquang.dao.AccountDAO;
import com.triquang.dao.TransactiondetailsDAO;
import com.triquang.entity.Account;
import com.triquang.entity.Transactiondetails;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class TransactionService {

	private TransactiondetailsDAO transactiondetailsDAO;
	private AccountDAO accountDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;

	public TransactionService(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		transactiondetailsDAO = new TransactiondetailsDAO();
		accountDAO = new AccountDAO();
	}

	public void listTransactionDetails() throws ServletException, IOException {
		listTransactionDetails(null);
	}

	public void listTransactionDetails(String message) throws ServletException, IOException {
		List<Transactiondetails> listTransactionDetails = transactiondetailsDAO.listAll();
		request.setAttribute("listTransactionDetails", listTransactionDetails);

		if (message != null) {
			request.setAttribute("message", message);
		}

		String listPage = "frontend/transaction_detail.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);

	}

	public void showTransactiondetailsNewForm() throws ServletException, IOException {
		List<Account> listAccount = accountDAO.listAll();
		request.setAttribute("listAccount", listAccount);

		String newPage = "frontend/transaction_form.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(newPage);
		requestDispatcher.forward(request, response);
	}

	public void createTransaction() throws ServletException, IOException {

		Transactiondetails newTransactiond = new Transactiondetails();
		
		readTransactionFields(newTransactiond);

		Transactiondetails createdTransactiond = transactiondetailsDAO.create(newTransactiond);

		if (createdTransactiond.getTransId() > 0) {
			String message = " Successfully.";
			listTransactionDetails(message);
		}
	}

	private void readTransactionFields(Transactiondetails transDetails) throws ServletException {
		double transMoney = Double.parseDouble(request.getParameter("transMoney"));
		Integer transType = Integer.parseInt(request.getParameter("transType"));

		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		Date dateOfTrans = null;

		try {
			dateOfTrans = dateFormat.parse(request.getParameter("dateOfTrans"));
		} catch (ParseException ex) {
			ex.printStackTrace();
			throw new ServletException("Error parsing dateOfTrans date (format is MM/dd/yyyy)");
		}

		transDetails.setTransType(transType);
		transDetails.setDateOfTrans(dateOfTrans);

		Integer accountId = Integer.parseInt(request.getParameter("account"));
		Account account = accountDAO.get(accountId);
		double balance = account.getBalance();

		if (transType == 1) {
			transDetails.setTransMoney(transMoney);
			account.setBalance(balance + transMoney);
			accountDAO.update(account);

		} else if (transType == 2) {
			if (balance < transMoney) {
				String message = "You don't have enough money";
				request.setAttribute("message", message);
			} else {
				transDetails.setTransMoney(transMoney);
				account.setBalance(balance - transMoney);
				accountDAO.update(account);

			}
		}

		transDetails.setAccount(account);

	}

	public void editTransaction() throws ServletException, IOException {
		Integer tranId = Integer.parseInt(request.getParameter("id"));
		Transactiondetails transactiondetails = transactiondetailsDAO.get(tranId);
		List<Account> listAccount = accountDAO.listAll();

		request.setAttribute("transactiondetails", transactiondetails);
		request.setAttribute("listAccount", listAccount);

		String editPage = "frontend/transaction_form.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(editPage);
		requestDispatcher.forward(request, response);

	}

	public void updateTransaction() throws ServletException, IOException {
		String transType = request.getParameter("transType");

		Transactiondetails existTransaction = transactiondetailsDAO.get(transType);
		// Transactiondetails findBytransTypeId =
		// transactiondetailsDAO.findBytransType(transType);
//
//		if (findBytransTypeId != null && !existTransaction.equals(findBytransTypeId)) {
//			String message = "Could not update transaction.";
//			listTransactionDetails(message);
//			return;
//		}

		readTransactionFields(existTransaction);

		transactiondetailsDAO.update(existTransaction);

		String message = "The transaction has been updated successfully.";
		listTransactionDetails(message);
	}

	public void deleteTransaction() throws ServletException, IOException {
		Integer transId = Integer.parseInt(request.getParameter("id"));

		transactiondetailsDAO.delete(transId);

		String message = "The transaction has been deleted successfully.";
		listTransactionDetails(message);
	}

	public void listTransactionsByAccount() throws ServletException, IOException {
		int accountId = Integer.parseInt(request.getParameter("id"));
		List<Transactiondetails> listTransactions = transactiondetailsDAO.listByAccount(accountId);
		Account account = accountDAO.get(accountId);

		request.setAttribute("listTransactions", listTransactions);
		request.setAttribute("account", account);

		String listPage = "frontend/transaction_list_by_account.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);
	}

	public void viewTransactionDetail() throws ServletException, IOException {
		Integer transId = Integer.parseInt(request.getParameter("id"));
		Transactiondetails transaction = transactiondetailsDAO.get(transId);

		request.setAttribute("transaction", transaction);

		String detailPage = "frontend/transaction_detail.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(detailPage);
		requestDispatcher.forward(request, response);
	}

	public void search() throws ServletException, IOException {
		String keyword = request.getParameter("keyword");
		List<Transactiondetails> result = null;

		if (keyword.equals("")) {
			result = transactiondetailsDAO.listAll();
		} else {
			result = transactiondetailsDAO.search(keyword);
		}

		request.setAttribute("keyword", keyword);
		request.setAttribute("result", result);

		String resultPage = "frontend/search_result.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(resultPage);
		requestDispatcher.forward(request, response);
	}
}
