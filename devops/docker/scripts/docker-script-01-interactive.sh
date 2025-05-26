#!/bin/bash

echo this command runs an interactive terminal session in a new Ubuntu container.
docker run -i -t ubuntu /bin/bash

echo can run the same command but the shell prompt is missing.
docker run -i ubuntu /bin/bash
