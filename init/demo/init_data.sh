#!/bin/bash

datagen -script ./init/demo/data.sql --driver postgres --conn postgres://test001:test001@localhost:5432/messagehub?sslmode=disable
