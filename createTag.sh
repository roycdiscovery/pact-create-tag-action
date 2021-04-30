#!/usr/bin/env bash

echo """
pact_broker: $pact_broker
pact_broker_token: $pact_broker_token
participant_name: $participant_name
version: $version
tag: $tag
"""

docker run --rm \
 -e PACT_BROKER_BASE_URL=$pact_broker \
 -e PACT_BROKER_TOKEN=$pact_broker_token \
pactfoundation/pact-cli:latest \
broker create-version-tag \
--pacticipant "$participant_name" \
--version "$version" \
--tag "$tag"