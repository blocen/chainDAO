# chainDAO

A Chainlink service project: Bring results of proposals/DAO on-chain

Governance with proposals and voting are done on snapshot; e.g. https://snapshot.org/#/ens.eth

Using the graphql API and Chainlink oracles, we bring proposal results on-chain: https://docs.snapshot.org/graphql-api

## Install Locally

Install dependencies:

```bash
yarn
```

### Test

Run the local tests:

```bash
yarn test
```

Natively run the application (defaults to port 8080):

### Run

```bash
yarn start
```

## Call the external adapter/API server

```bash
curl -X GET -H "content-type:application/json" "http://localhost:8080/" --data '{"data":{"proposal_id":"0xd810c4cf2f09737a6f833f1ec51eaa5504cbc0afeeb883a21a7e1c91c8a597e4"}}'
```
