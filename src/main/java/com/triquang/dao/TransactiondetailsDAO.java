package com.triquang.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.triquang.entity.Transactiondetails;

public class TransactiondetailsDAO extends JpaDAO<Transactiondetails> implements GenericDAO<Transactiondetails> {
	@Override
	public Transactiondetails create(Transactiondetails transactiondetails) {
		transactiondetails.setDateOfTrans(new Date());		
		
		return super.create(transactiondetails);
	}

	@Override
	public Transactiondetails update(Transactiondetails transactiondetails) {
		return super.update(transactiondetails);
	}

	@Override
	public Transactiondetails get(Object transId) {
		return super.find(Transactiondetails.class, transId);
	}

	public List<Transactiondetails> search(String keyword) {
		return super.findWithNamedQuery("Transactiondetails.search", "keyword", keyword);
	}

	public Transactiondetails get(Integer transId, Integer accountId) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("transId", transId);
		parameters.put("accId", accountId);

		List<Transactiondetails> result = super.findWithNamedQuery("Transactiondetails.findByIdAndAccount", parameters);

		if (!result.isEmpty()) {
			return result.get(0);
		}
		return null;
	}

	@Override
	public void delete(Object transId) {
		super.delete(Transactiondetails.class, transId);
	}

	public Transactiondetails findBytransType(String transType) {
		List<Transactiondetails> result = super.findWithNamedQuery("Transactiondetails.findBytransType", "transType",
				transType);

		if (!result.isEmpty()) {
			return result.get(0);
		}

		return null;
	}
	
	public List<Transactiondetails> listByAccount(int accountId) {
		return super.findWithNamedQuery("Transactiondetails.listByAccount", "accId", accountId);
	}

	@Override
	public List<Transactiondetails> listAll() {
		return super.findWithNamedQuery("Transactiondetails.findAll");
	}

	@Override
	public long count() {
		return super.countWithNamedQuery("Transactiondetails.countAll");
	}

	public List<Transactiondetails> listByCustomer(Integer accId) {
		return super.findWithNamedQuery("Transactiondetails.findByAccount", "accId", accId);
	}

	public List<Transactiondetails> listMostRecentTransactiondetails() {
		return super.findWithNamedQuery("Transactiondetails.findAll", 0, 3);
	}
}
