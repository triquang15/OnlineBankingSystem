package com.triquang.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mindrot.jbcrypt.BCrypt;

import com.triquang.entity.Account;

public class AccountDAO extends JpaDAO<Account> implements GenericDAO<Account> {

	@Override
	public Account create(Account account) {
		
		return super.create(account);
	}
	
	@Override
	public Account update(Account account) {

		return super.update(account);
	}

	@Override
	public Account get(Object id) {
		return super.find(Account.class, id);
	}

	@Override
	public void delete(Object id) {
		super.delete(Account.class, id);
	}

	@Override
	public List<Account> listAll() {
		return super.findWithNamedQuery("Account.findAll");
	}

	@Override
	public long count() {
		return super.countWithNamedQuery("Account.countAll");
	}

	public Account findByEmail(String email) {
		List<Account> result = super.findWithNamedQuery("Account.findByEmail", "email", email);

		if (!result.isEmpty()) {
			return result.get(0);
		}

		return null;
	}

	public Account checkLogin(String email, String password) {
		Map<String, Object> parameters = new HashMap<>();
		String encryptedPassword = HashGenerator.generateMD5(password);
		parameters.put("email", email);
		parameters.put("password", encryptedPassword);

		List<Account> result = super.findWithNamedQuery("Account.checkLogin", parameters);

		if (!result.isEmpty()) {
			return result.get(0);
			
		}
		return null;
	}

}
