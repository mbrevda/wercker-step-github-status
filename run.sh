#!/bin/bash
set +e

if [ -z "$WERCKER_GITHUB_STATUS_TOKEN" ]
then
    fail "missing github_token"
fi


if [ "$WERCKER_RESULT" = "passed" ]; then
	STATUS="{\"state\":\"success\", \"context\":\"$WERCKER_GITHUB_STATUS_CONTEXT\", \"description\":\"$WERCKER_GITHUB_STATUS_MSG\", \"target_url\":\"$WERCKER_GITHUB_STATUS_URL\"}";
elif [ "$WERCKER_RESULT" = "failed" ]; then
	STATUS="{\"state\":\"failure\", \"context\":\"$WERCKER_GITHUB_STATUS_CONTEXT\", \"description\":\"$WERCKER_GITHUB_STATUS_FAIL\", \"target_url\":\"$WERCKER_GITHUB_STATUS_URL\"}";
else
	STATUS="{\"state\":\"pending\", \"context\":\"$WERCKER_GITHUB_STATUS_CONTEXT\", \"description\":\"$WERCKER_GITHUB_STATUS_MSG\", \"target_url\":\"$WERCKER_GITHUB_STATUS_URL\"}";
fi

curl -H "Authorization: token $WERCKER_GITHUB_STATUS_TOKEN" -d "$STATUS" \
	https://api.github.com/repos/$WERCKER_GIT_OWNER/$WERCKER_GIT_REPOSITORY/statuses/$WERCKER_GIT_COMMIT
