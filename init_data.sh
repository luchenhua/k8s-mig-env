#!/bin/bash

go install github.com/codingconcepts/datagen@latest && datagen -script datagen.script --driver postgres --conn postgres://test001:test001@localhost:5432/msghub?sslmode=disable
