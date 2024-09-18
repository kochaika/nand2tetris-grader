# nand2tetris-grader ![CI Tests status](https://github.com/kochaika/nand2tetris-grader/actions/workflows/ci.yml/badge.svg) ![Deploy status](https://github.com/kochaika/nand2tetris-grader/actions/workflows/release.yml/badge.svg)

This repo with docker image is using as a base for grading [nand2tetris](https://www.nand2tetris.org/) tasks via GitHub Actions.  
Based on [nand2tetris web-ide](https://github.com/nand2tetris/web-ide).

## Docker hub
Image: [pro100kot/nand2tetris-grader:latest](https://hub.docker.com/repository/docker/pro100kot/nand2tetris-grader/)

## Usage example
For now, is using here: https://github.com/kochaika/nand2tetris-hw-2024

### Manual path selection
```yaml
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

### Run on Pull Request changes
You can use this action to check students' homework assignments that they turn in a PR format. 
If each homework assignment is to be completed as a separate PR and the files are to be located in a separate directory, 
the path can be defined automatically:

```yaml
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

      - name: Get changed files
        id: changed-files
        uses: tj-actions/changed-files@v44
        
      - name: List all changed files
        env:
          ALL_CHANGED_FILES: ${{ steps.changed-files.outputs.all_changed_files }}
        run: |
          echo "Files changed:"
          echo ${ALL_CHANGED_FILES}
          ALL_CHANGED_FILES_ARR=(${ALL_CHANGED_FILES})
          DIR_NAME="$(dirname ${ALL_CHANGED_FILES_ARR[0]})"
          SAME_DIR=true
          for file in "${ALL_CHANGED_FILES_ARR[@]}"; do 
            if [ "$DIR_NAME" != "$(dirname $file)" ]; then
            SAME_DIR=false
            break
            fi
          done
          echo "All changed files are in the same directory: $SAME_DIR"
          if [ "$SAME_DIR" = true ] ; then
             echo "HW_DIR=$DIR_NAME" >> $GITHUB_ENV
             exit 0
          else
             exit 1
          fi     

      - name: Call the action kochaika/nand2tetris-grader
        uses: kochaika/nand2tetris-grader@main
        with:
          dir: /github/workspace/${{ env.HW_DIR }}

```
 
