package com.example.vault.client;

import org.springframework.vault.authentication.TokenAuthentication;
import org.springframework.vault.client.VaultEndpoint;
import org.springframework.vault.core.VaultTemplate;
import org.springframework.vault.support.VaultResponseSupport;

public class VaultClientApplication {

	private static final String VAULT_HOST = "127.0.0.1";
	private static final int VAULT_PORT = 8200;

	public static void main(String[] args) {
		new VaultClientApplication().testHttp();
	}

	private void testHttp() {
		VaultEndpoint vaultEndpoint = new VaultEndpoint();
		vaultEndpoint.setScheme("http");
		vaultEndpoint.setHost("127.0.0.1");
		vaultEndpoint.setPort(8200);

		VaultTemplate vaultTemplate = new VaultTemplate(
				vaultEndpoint,
				new TokenAuthentication("myroot")
		);

		Secrets secrets = new Secrets();
		secrets.username = "hello";
		secrets.password = "world";

		vaultTemplate.write("secret/myapp", secrets);

		VaultResponseSupport<Secrets> response = vaultTemplate.read("secret/myapp", Secrets.class);
		System.out.println(
				String.format(
						"username=%s password=%s",
						response.getData().getUsername(), response.getData().getPassword()
				)
		);

		vaultTemplate.delete("secret/myapp");
	}

	private void testHttps() {

	}
}
