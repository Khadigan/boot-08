package it.corso.service;

import it.corso.model.Prodotto;

public interface ProdottoService {

	void registraProdotto(Prodotto prodotto);
	Prodotto getProdottoById(int id);
}
