#!/bin/bash
mvn clean -DskipTests install
cd docs-web
mvn jetty:run