#!/usr/bin/env bash

echo """
PACT_BROKER: $PACT_BROKER
PACT_BROKER_TOKEN: $PACT_BROKER_TOKEN
participant_name: $participant_name
version: $version
tag: $tag
"""

docker run --rm \
 -e PACT_BROKER_BASE_URL=$PACT_BROKER \
 -e PACT_BROKER_TOKEN \
pactfoundation/pact-cli:latest \
broker create-version-tag \
--pacticipant "$participant_name" \
--version "$version" \
--tag "$tag"