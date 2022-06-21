package com.triquang.service;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.List;

import com.triquang.dao.AccountDAO;
import com.triquang.dao.HashGenerator;
import com.triquang.entity.Account;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AccountService {
	private AccountDAO accountDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;

	public AccountService(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		this.accountDAO = new AccountDAO();
	}

	public void listAccounts(String message) throws ServletException, IOException {
		List<Account> listAccount = accountDAO.listAll();

		if (message != null) {
			request.setAttribute("message", message);
		}

		request.setAttribute("listAccount", listAccount);

		String listPage = "account_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);
	}

	public void listAccounts() throws ServletException, IOException {
		listAccounts(null);
	}

	public void createAccount() throws ServletException, IOException {
		String email = request.getParameter("email");
		Account existAccount = accountDAO.findByEmail(email);

		if (existAccount != null) {
			String message = "Could not create new account: the email " + email
					+ " is already registered by another account.";
			listAccounts(message);

		} else {
			Account newAccount = new Account();
			updateAccountFieldsFromForm(newAccount);
			accountDAO.create(newAccount);

			String message = "New account has been created successfully.";
			listAccounts(message);

		}

	}

	private void updateAccountFieldsFromForm(Account account) {

		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String fullname = request.getParameter("fullname");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		double balance = Double.parseDouble(request.getParameter("balance"));

		if (email != null && !email.equals("")) {
			account.setEmail(email);
		}

		account.setUsername(username);
		account.setFullname(fullname);

		if (password != null && !password.equals("")) {
			String encryptedPassword = HashGenerator.generateMD5(password);
			account.setPassword(encryptedPassword);
		}

		account.setPhone(phone);
		account.setBalance(balance);
	}

	public void registerAccount() throws ServletException, IOException {
		String email = request.getParameter("email");
		Account existAccount = accountDAO.findByEmail(email);
		String message = "";

		if (existAccount != null) {
			message = "Could not register. The email " + email + " is already registered by another account.";
		} else {

			Account newAccount = new Account();
			updateAccountFieldsFromForm(newAccount);
			accountDAO.create(newAccount);

			message = "You have registered successfully! Thank you.<br/>" + "<a href='login'>Click here</a> to login";
		}

		String messagePage = "frontend/message.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(messagePage);
		request.setAttribute("message", message);
		requestDispatcher.forward(request, response);
	}

	public void editAccount() throws ServletException, IOException {
		Integer accountId = Integer.parseInt(request.getParameter("id"));
		Account account = accountDAO.get(accountId);

		request.setAttribute("account", account);

		String editPage = "account_form.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(editPage);
		requestDispatcher.forward(request, response);
	}

	public void updateAccount() throws ServletException, IOException {
		Integer accountId = Integer.parseInt(request.getParameter("accountId"));
		String email = request.getParameter("email");

		Account accountByEmail = accountDAO.findByEmail(email);
		String message = null;

		if (accountByEmail != null && accountByEmail.getAccId() != accountId) {
			message = "Could not update the account ID " + accountId
					+ "because there's an existing account having the same email.";

		} else {

			Account accountById = accountDAO.get(accountId);
			updateAccountFieldsFromForm(accountById);

			accountDAO.update(accountById);

			message = "The account has been updated successfully.";
		}

		listAccounts(message);
	}

	public void deleteAccount() throws ServletException, IOException {
		Integer accountId = Integer.parseInt(request.getParameter("id"));
		accountDAO.delete(accountId);

		String message = "The account has been deleted successfully.";
		listAccounts(message);
	}

	public void showLogin() throws ServletException, IOException {
		String loginPage = "frontend/login.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(loginPage);
		dispatcher.forward(request, response);
	}

	public void doLogin() throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		Account account = accountDAO.checkLogin(email, password);

		if (account == null) {

			String message = "Login failed. Please check your email and password.";
			request.setAttribute("message", message);
			showLogin();

		} else {

			HttpSession session = request.getSession();
			session.setAttribute("loggedAccount", account);

			Object objRedirectURL = session.getAttribute("redirectURL");

			if (objRedirectURL != null) {
				String redirectURL = (String) objRedirectURL;
				session.removeAttribute("redirectURL");
				response.sendRedirect(redirectURL);
			} else {
				showAccountProfile();
			}

		}
	}

	public void showAccountProfile() throws ServletException, IOException {
		String profilePage = "frontend/account_profile.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(profilePage);
		dispatcher.forward(request, response);
	}

	public void showAccountProfileEditForm() throws ServletException, IOException {

		String editPage = "frontend/edit_profile.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(editPage);
		dispatcher.forward(request, response);
	}

	public void updateAccountProfile() throws ServletException, IOException {
		Account account = (Account) request.getSession().getAttribute("loggedAccount");
		updateAccountFieldsFromForm(account);
		accountDAO.update(account);

		showAccountProfile();

	}

	public void newAccount() throws ServletException, IOException {

		String accountForm = "account_form.jsp";
		request.getRequestDispatcher(accountForm).forward(request, response);

	}

	public void showAccountRegistrationForm() throws ServletException, IOException {

		String registerForm = "frontend/register_form.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(registerForm);
		dispatcher.forward(request, response);
	}
}
