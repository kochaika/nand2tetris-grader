# nand2tetris-grader ![CI Tests status](https://github.com/kochaika/nand2tetris-grader/actions/workflows/ci.yml/badge.svg)

This repo with docker image is using as a base for grading [nand2tetris](https://www.nand2tetris.org/) tasks via GitHub Actions.  
Based on [nand2tetris web-ide](https://github.com/nand2tetris/web-ide).

## Docker hub
Image: [pro100kot/nand2tetris-grader:latest](https://hub.docker.com/repository/docker/pro100kot/nand2tetris-grader/)

## Usage example
```
name: HomeWorkChecker

on:
  pull_request:
    branches: [ "main" ]

jobs:
  hw-checker-job:
    runs-on: ubuntu-latest
    steps:
      - name: Check out repository code
        uses: actions/checkout@v4

      - name: Call the action kochaika/nand2tetris-grader
        uses: kochaika/nand2tetris-grader@main
        with:
          dir: /github/workspace/<path_to_nand2tetris_project>
```

 