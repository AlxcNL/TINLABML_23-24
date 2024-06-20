#!/usr/bin/env bash

ls | xargs -I {} docker-compose -f {}/docker-compose.yaml build
