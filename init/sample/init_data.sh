#!/bin/bash

datagen -script ./init/sample/sample --driver postgres --conn postgres://test001:test001@localhost:5432/msghub?sslmode=disable
