CLI_NAME = summon-provider-ssm

install: uninstall
	sudo mkdir -p /usr/local/lib/summon
	sudo cp ./$(CLI_NAME) /usr/local/lib/summon/ssm
	sudo chmod +x /usr/local/lib/summon/ssm

uninstall:
	sudo rm -f /usr/local/lib/summon/ssm