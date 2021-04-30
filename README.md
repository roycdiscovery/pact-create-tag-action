# pact-create-tag-action

Publishes OAS and test evidence to a Pactflow server for 'bi-directional' testing (relies on [actions/checkout](https://github.com/marketplace/actions/checkout) being called first).

## Example
```yaml
# (This just saves defining these multiple times for different pact jobs)
env:
  version: "1.2.3"
  participant_name: "my-api-provider"
  pact_broker: ${{ secrets.PACT_BROKER }}

jobs:
  pact-create-tag:
    runs-on: ubuntu-latest
    steps:
      - uses: roycdiscovery/pact-create-tag-action@v1.0
        env:
          tag: prod
```

## Notes
- If you change your `participant_name` you willl need to inform your consumers (their pact tests rely on the name you use here).
- Assumes 'success = true' (you can control this action by depending on an earliler successful test job).
- You must ensure `additionalProperties` in your OAS is set to `false` on any response body, to ensure a consumer won't get false positives if they add a new field that isn't actually part of the spec.
