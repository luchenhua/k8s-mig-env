#!/bin/bash

go get -u github.com/codingconcepts/datagen && datagen -script datagen.script --driver postgres --conn postgres://test001:test001@localhost:5432/msghub?sslmode=disable
