-include .env

.PHONY: all test deploy

build:; forge build

test:; forge test

install:; install :; forge install cyfrin/foundry-devops@0.2.3 --no-commit && forge install smartcontractkit/chainlink-brownie-contracts@1.3.0 --no-commit && forge install foundry-rs/forge-std@v1.9.2 --no-commit && forge install transmissions11/solmate@v6 --no-commit

deploy-sepolia:
	@forge script script/DeployRaffle.s.sol:DeployRaffle --rpc-url $(SEPOLIA_URL) --account sepolia --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv